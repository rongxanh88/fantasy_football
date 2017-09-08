class Defense < ApplicationRecord
  validates :api_id, :name, :expected_point_production, presence: true
  validates  :api_id, :name, uniqueness: true

  def self.save_all(defenses)
    defenses.each do |id, team|
      avg_points = team.average_points
      Defense.create!(api_id: id, name: team.name, expected_point_production: avg_points)
    end
  end
end