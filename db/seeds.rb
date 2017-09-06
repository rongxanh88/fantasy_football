require 'pry'

class Seed

  FANTASY_POINTS = {
    "pass_tds": 4,
    "pass_yards": 0.04,
    "pass_ints": -1,
    "rec_tds": 6,
    "rec_yards": 0.1,
    "receptions": 1,
    "rush_tds": 6,
    "rush_yards": 0.1,
    "punt_ret_td": 6,
    "kick_ret_td": 6,
    "fum_lost": -1,
    "pass_yards_300": 3,
    "rush_or_rec_yards_100": 3
  }

  def self.start
    schedule = GameSchedule.new
    schedule.store_schedule
    games_by_date = schedule.games.uniq {|game| game.date}
    dates = games_by_date.map {|game| game.date.gsub('-', '')}
    service = SportsFeedService.new
    players = {}
    dates.each do |date|
      player_stats = service.daily_player_stats(date)
      stats = player_stats[:dailyplayerstats][:playerstatsentry]

      stats.each do |stat|
        player_id = stat[:player][:ID]
        player = players[player_id] || Player.new(stat[:player])
        player_stat = PlayerStats.new(stat[:stats])
        player.stats << player_stat
        players[player_id] = player
        puts "Add player ID: #{player_id} stats\r"
      end
      puts "All stats for date: #{date} memoized\r"
    end
    puts "All stats done\r"

    players.each do |id, player|

      football_player = FootballPlayer.new(
        api_id: id, first_name: player.first_name, last_name: player.last_name,
        position: player.position
        )

      expected_production_list = []
      player.stats.each do |stat|
        expected_production = 0
        expected_production += (stat.pass_tds[:"#text"].to_i * FANTASY_POINTS[:pass_tds])
        expected_production += (stat.pass_yards[:"#text"].to_i * FANTASY_POINTS[:pass_yards])
        expected_production += (stat.pass_ints[:"#text"].to_i * FANTASY_POINTS[:pass_ints])
        expected_production += (stat.rec_tds[:"#text"].to_i * FANTASY_POINTS[:rec_tds])
        expected_production += (stat.rec_yards[:"#text"].to_i * FANTASY_POINTS[:rec_yards])
        expected_production += (stat.receptions[:"#text"].to_i * FANTASY_POINTS[:receptions])
        expected_production += (stat.rush_tds[:"#text"].to_i * FANTASY_POINTS[:rush_tds])
        expected_production += (stat.rush_yards[:"#text"].to_i * FANTASY_POINTS[:rush_yards])
        expected_production += (stat.punt_ret_td[:"#text"].to_i * FANTASY_POINTS[:punt_ret_td])
        expected_production += (stat.kick_ret_td[:"#text"].to_i * FANTASY_POINTS[:kick_ret_td])
        expected_production += (stat.fum_lost[:"#text"].to_i * FANTASY_POINTS[:fum_lost])

        if (stat.pass_yards[:"#text"].to_i >= 300)
          expected_production += FANTASY_POINTS[:pass_yards_300]
        end
        
        if (stat.pass_yards[:"#text"].to_i >= 100)
          expected_production += FANTASY_POINTS[:rush_or_rec_yards_100]
        end
        
        if (stat.rush_yards[:"#text"].to_i >= 100)
          expected_production += FANTASY_POINTS[:rush_or_rec_yards_100]
        end
        
        expected_production_list << expected_production
      end

      avg_point_production = (expected_production_list.sum / expected_production_list.count.to_f)

      football_player.update(expected_point_production: avg_point_production)
      status = football_player.save
      puts status
    end
  end
end

Seed.start