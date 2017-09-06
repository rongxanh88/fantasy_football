require 'pry'

class Seed

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
        expected_production = PlayerStats.calculate_expected_point_production(stat)
        
        expected_production_list << expected_production
      end

      avg_point_production = (expected_production_list.sum / expected_production_list.count.to_f).round(2)

      football_player.update(expected_point_production: avg_point_production)
      status = football_player.save
      puts status
    end
  end
end

Seed.start