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

  def self.get_defense_data(date)
    # seasons = ['2014-2014-regular', '2015-2015-regular', '2016-2016-regular']
    service = SportsFeedService.new
    result = service.daily_fantasy_points(date)
    binding.pry
    # defenses = {}
    # #api updated, need to add a date
    # seasons.each do |season|
    #   # dfs_points = service.daily_fantasy_points(season)
    #   #call dfs service with dates
    #   binding.pry
    #   dfs_all_players = dfs_points[:dailydfs][:dfsEntries][1][:dfsRows]

    #   dfs_all_players.each do |dfs_stat|
    #     if dfs_stat[:player].nil?
    #       defense_id = dfs_stat[:team][:ID]
    #       if defenses[defense_id]
    #         defense = defenses[defense_id]
    #         defense.add_points(dfs_stat[:fantasyPoints])
    #         defenses[defense_id] = defense
    #       else
    #         defense = DefenseCalculator.new(dfs_stat[:team])
    #         defense.add_points(dfs_stat[:fantasyPoints])
    #         defenses[defense_id] = defense
    #       end
    #     end
    #   end
    # end
    # defenses
  end
end