class Defense < ApplicationRecord
  validates :api_id, :name, :expected_point_production, presence: true
  validates  :api_id, :name, uniqueness: true

  def self.save_all(defenses)
    defenses.each do |id, team|
      avg_points = team.average_points
      Defense.create!(api_id: id, name: team.name, expected_point_production: avg_points)
    end
  end

  def self.get_all
    defenses = Defense.all
    defenses.reject { |defense| defense.salary.nil? }
  end

  def self.update_defense_salary(defense_name, salary)
    defense = Defense.find_by(name: defense_name)
    
    if defense
      defense.salary = salary
      defense.save
    end
  end

end