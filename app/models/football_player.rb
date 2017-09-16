class FootballPlayer < ApplicationRecord
  validates :api_id, :first_name, :last_name, :position,
    :expected_point_production, presence: true

  validates :api_id, uniqueness: true

  def self.position(position)
    players_with_stats         = FootballPlayer.where(position: position)
    service                    = FFNerdService.new
    active_players             = service.active_players_by_position(position)
    injured_players            = service.injured_players
    bye_weeks                  = service.bye_weeks
    current_week, weather_data = service.current_game_week

    teams_on_bye = bye_weeks.select { |team| team[:byeWeek] == current_week }
                            .map { |team| team[:team] }

    non_injured_active_players = active_players.reject do |name|
      injured_players.include?(name)
    end

    players = players_with_stats.select do |player|
      non_injured_active_players.include?(player.full_name)
    end

    players = players.reject do |player|
      teams_on_bye.include?(player.team)
    end

    players = players.reject do |player|
      player.salary.nil? || player.team.nil?
    end

    players.reject do |player|
      current_dt = DateTime.now
      team = player.team

      games = weather_data.select do |weather_game|
        weather_game.away_team == team || weather_game.home_team == team
      end

      game = games[0]
      flag = false
      game_time = DateTime.parse(game.game_date + " " + game.game_time + " " + "EST")
      comparison = current_dt <=> game_time
      flag = true if comparison > 0
    end
  end

  def self.update_teams(position, players)
    service = FFNerdService.new
    active_players_with_teams = service.active_players_by_team(position)

    active_players_with_teams.each do |player, team|
      fb_player = players.select { |plyr| plyr.full_name == player }
      if !fb_player.empty?
        fb_player[0].team = team
        fb_player[0].save
        puts "Updated #{fb_player[0].full_name}"
      end
    end
  end

  def self.save_all_data(players)
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

  def self.update_player_salary(full_name, salary)
    split_name = full_name.split(' ')
    first_name = split_name[0]
    last_name = split_name[1]
    player = FootballPlayer.find_by(first_name: first_name, last_name: last_name)

    if player
      player.salary = salary
      player.save
    end
  end

  def full_name
    first_name + " " + last_name
  end
end