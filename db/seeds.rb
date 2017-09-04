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
    "fum_lost": -1
  }

  # 300+ Passing Yards	3	0
  # 100+ Yard Receiving Game	3	0

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

    # players.each do |id, player|
    #   binding.pry

    #   football_player = FootballPlayer.new(
    #     api_id: id, first_name: player.first_name, last_name: player.last_name,
    #     position: player.position
    #     )

    #   player.stats.each do |stat|
    #     expected_production = 0

    #   end
    # end
    # binding.pry
  end
end

Seed.start