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
    point_production_list.sum / point_production_list.count.to_f
  end
end