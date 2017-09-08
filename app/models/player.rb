class Player
  attr_reader :id, :last_name, :first_name, :position
  attr_accessor :stats

  def initialize(attrs)
    @id         = attrs[:ID]
    @last_name  = attrs[:LastName]
    @first_name = attrs[:FirstName]
    @position   = attrs[:Position]
    @stats = []
  end

  def self.get_player_data(date, players)
    service = SportsFeedService.new
    player_stats = service.daily_player_stats(date)
    stats = player_stats[:dailyplayerstats][:playerstatsentry]

    stats.each do |stat|
      player_id = stat[:player][:ID]
      player = players[player_id] || Player.new(stat[:player])
      player_stat = PlayerStats.new(stat[:stats])
      player.stats << player_stat
      players[player_id] = player
      puts "Add player ID: #{player_id} stats\r"
    end
    players
  end

end