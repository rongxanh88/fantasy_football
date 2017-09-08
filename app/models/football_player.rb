class FootballPlayer < ApplicationRecord
  validates :api_id, :first_name, :last_name, :position,
    :expected_point_production, presence: true

  validates :api_id, uniqueness: true

  def self.position(position)
    players_with_stats = FootballPlayer.where(position: position)
    service = FFNerdService.new
    active_players = service.active_players_by_position(position)
    injured_players = service.injured_players

    non_injured_active_players = active_players.reject do |name|
      injured_players.include?(name)
    end

    players_with_stats.select do |player|
      non_injured_active_players.include?(player.full_name)
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

  def full_name
    first_name + " " + last_name
  end
end