require 'pry'

class Seed

  def self.start
    schedule = GameSchedule.new
    schedule.store_schedule
    #from here, we need to make an api call to get player stats?
    games_by_date = schedule.games.uniq {|game| game.date}
    dates = games_by_date.map {|game| game.date.gsub('-', '')}
    service = SportsFeedService.new
    dates.each do |date|
      player_stats = service.daily_player_stats(date)
      stats = player_stats[:dailyplayerstats][:playerstatsentry]
      binding.pry
    end

    binding.pry
  end
end

Seed.start