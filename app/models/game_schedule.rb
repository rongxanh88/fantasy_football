class GameSchedule
  attr_reader :games

  def initialize
    @games = []
  end

  def store_schedule
    service = SportsFeedService.new
    results = service.full_season_schedule
    games   = results[:fullgameschedule][:gameentry]
    @games = games.map do |game_details|
      FootballGame.new(game_details)
    end
  end
end