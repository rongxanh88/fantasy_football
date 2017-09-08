class DefStatGenerator
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

  def self.get_defense_data(date, defenses)
    service = SportsFeedService.new
    result = service.daily_fantasy_points(date)

    if result[:dfsEntries] && result[:dfsEntries][1] && result[:dfsEntries][1][:dfsRows]
      dfs_all_players = result[:dfsEntries][1][:dfsRows]

      dfs_all_players.each do |dfs_stat|
        if dfs_stat[:player].nil?
          defense_id = dfs_stat[:team][:ID]
          if defenses[defense_id]
            defense = defenses[defense_id]
            defense.add_points(dfs_stat[:fantasyPoints])
            defenses[defense_id] = defense
          else
            defense = DefStatGenerator.new(dfs_stat[:team])
            defense.add_points(dfs_stat[:fantasyPoints])
            defenses[defense_id] = defense
          end
        end
      end
    end
    defenses
  end
end