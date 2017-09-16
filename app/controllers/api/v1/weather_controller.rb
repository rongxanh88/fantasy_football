class Api::V1::WeatherController < ApplicationController
  def index
    @weather_data = Rails.cache.fetch("weather_cache", expires_in: 30.minutes) do
      GameWeather.weather_data
    end
  end
end