json.weatherData @weather_data.each do |game_weather|
  json.isDome game_weather.is_dome
  json.low game_weather.low
  json.high game_weather.high
  json.forecast game_weather.forecast
  json.windSpeed game_weather.wind_speed
  json.windChill game_weather.wind_chill
  json.imageLink game_weather.image_link
  json.awayTeam game_weather.away_team
  json.homeTeam game_weather.home_team
end