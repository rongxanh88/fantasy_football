class DefenseCalculator
  attr_reader :id, :name
  attr_accessor :point_production_list

  def initialize(attrs)
    @id                    = attrs[:ID]
    @name                  = attrs[:Name]
    @point_production_list = []
  end

  def add_points(points)
    point_production_list << points
  end

  def average_points
    total = point_production_list.sum { |num| num.to_f }
    (total / point_production_list.count).round(2)
  end
end