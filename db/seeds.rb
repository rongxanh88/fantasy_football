class Seed

  def self.start
    schedule = GameSchedule.new
    schedule.store_schedule
    games_by_date = schedule.games.uniq {|game| game.date}

    dates = games_by_date.map {|game| game.date.gsub('-', '')}
    players = {}
    defenses = {}
    index = 0

    dates.each do |date|
      Player.get_player_data(date, players)
      puts "All stats for date: #{date} memoized\r"
      index += 1
      sleep(1)
      next if (index % 2 == 0) || (index % 3 == 0)
      DefStatGenerator.get_defense_data(date, defenses)
      puts "Got defensive data for #{date}"
    end

    Defense.save_all(defenses)
    FootballPlayer.save_all_data(players)
    puts "All stats done\r"
  end
  
  def self.update_teams
    quarterbacks = FootballPlayer.where(position: "QB")
    receivers    = FootballPlayer.where(position: "WR")
    runningbacks = FootballPlayer.where(position: "RB")
    tightends    = FootballPlayer.where(position: "TE")
    FootballPlayer.update_teams("QB", quarterbacks)
    FootballPlayer.update_teams("WR", receivers)
    FootballPlayer.update_teams("RB", runningbacks)
    FootballPlayer.update_teams("TE", tightends)
  end

end

Seed.start
Seed.update_teams