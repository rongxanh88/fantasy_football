require "rails_helper"

RSpec.describe "Weather Data", :type => :request do

  context "successful request for weather forecasts on gameday" do
    it "returns weather forecasts for all games" do
      get "/api/v1/weather.json"
      result = JSON.parse(response.body, symbolize_names: true)
      weather_attrs = result[:weatherData][0].count
      binding.pry
      expect(response).to have_http_status(200)
      expect(weather_attrs).to eq(9)
    end
  end
end