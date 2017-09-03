require 'base64'
require 'faraday'
require 'json'
require 'pry'

class SportsFeedService

  def initialize
    @login = ENV['sports_feed_login']
    @pw    = ENV['sports_feed_pw']
    @conn  = Faraday.new(url: "https://api.mysportsfeeds.com/v1.1/pull/nfl")
  end

  def full_season_schedule
    # https://api.mysportsfeeds.com/v1.1/pull/nfl/{season-name}/full_game_schedule
    authorization = "#{login}:#{pw}"
    encoded_authorization = Base64.encode64(authorization)
    season_name = "2014-2014-regular"
    url = "https://api.mysportsfeeds.com/v1.1/pull/nfl/#{season_name}/full_game_schedule.json"
    # conn = Faraday.new(url: url)

    response = conn.get do |req|
      req.headers['Authorization'] = "Basic #{encoded_authorization}"
      # req.headers['Accept-Encoding'] = 'gzip'
    end

    #need to decode gzipped responses
    JSON.parse(response.body, symbolize_names: true)
  end

  def daily_player_stats(date)
    url = "https://api.mysportsfeeds.com/v1.1/pull/nfl/{season-name}/daily_player_stats.{format}?fordate={for-date}"
  end

  private
    attr_reader :login, :pw
end