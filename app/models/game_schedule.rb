class GameSchedule
  attr_reader :games, :seasons

  def initialize
    @games = []
    @seasons = ['2014-2014-regular', '2015-2015-regular', '2016-2016-regular']
  end

  def store_schedule
    service = SportsFeedService.new

    seasons.each do |season|
      results = service.full_season_schedule(season)
      games   = results[:fullgameschedule][:gameentry]
      games.each do |game_details|
        @games << FootballGame.new(game_details)
      end
      # @games = games.map do |game_details|
      #   FootballGame.new(game_details)
      # end
    end
  end
end