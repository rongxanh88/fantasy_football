require 'pry'

class Seed

  def self.start
    schedule = GameSchedule.new
    schedule.store_schedule
    #from here, we need to make an api call to get player stats?
    games_by_date = schedule.games.uniq {|game| game.date}
    dates = games_by_date.map {|game| game.date.gsub('-', '')}     

    #https://api.mysportsfeeds.com/v1.1/pull/nfl/{season-name}/daily_player_stats.{format}?fordate={for-date}

    #fordate={for-date}	a valid date in the form of YYYYMMDD
    #position={list-of-positions} we want qb, wr, rb, te, DEF?

    binding.pry
  end
end

Seed.start