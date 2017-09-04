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
    binding.pry
  end
end

Seed.start