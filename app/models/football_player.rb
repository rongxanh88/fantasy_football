class FootballPlayer < ApplicationRecord
  validates :api_id, :first_name, :last_name, :position,
    :expected_point_production, presence: true

  validates :api_id, uniqueness: true

  def self.quarterbacks
    qb_with_stats = FootballPlayer.where(position: "QB")
    service = FFNerdService.new
    active_qbs = @active_qbs || service.active_players_by_position("QB")
    injured_players = @injured_players || service.injured_players

    non_injured_active_qbs = active_qbs.reject do |name|
      injured_players.include?(name)
    end

    qb_with_stats.select do |qb|
      non_injured_active_qbs.include?(qb.full_name)
    end
  end

  def full_name
    first_name + " " + last_name
  end
end