class GameWeather
  attr_reader :away_team, :home_team, :game_date, :game_time, :is_dome,
              :low, :high, :forecast, :wind_chill, :wind_speed, :image_link
  
  def initialize(attrs)
    @away_team  = attrs[:awayTeam]
    @home_team  = attrs[:homeTeam]
    @game_date  = attrs[:gameDate]
    @game_time  = attrs[:gameTimeET]
    @is_dome    = attrs[:isDome]
    @low        = attrs[:low]
    @high       = attrs[:high]
    @forecast   = attrs[:forecast]
    @wind_chill = attrs[:windChill]
    @wind_speed = attrs[:windSpeed]
    @image_link = attrs[:mediumImg]
  end
end