class FootballGame
  attr_reader :id, :week, :date, :awayTeam, :homeTeam, :location

  def initialize(attrs)
    @id       = attrs[:id]
    @week     = attrs[:week]
    @date     = attrs[:date]
    @awayTeam = attrs[:awayTeam]
    @homeTeam = attrs[:homeTeam]
    @location = attrs[:location]
  end
end