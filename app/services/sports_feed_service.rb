require 'base64'
require 'faraday'
require 'json'
require 'pry'

class SportsFeedService

  def initialize
    login = ENV['sports_feed_login']
    pw    = ENV['sports_feed_pw']
    authorization = "#{login}:#{pw}"
    encoded_authorization = Base64.encode64(authorization)

    @conn  = Faraday.new(url: "https://api.mysportsfeeds.com")
    @conn.headers['Authorization'] = "Basic #{encoded_authorization}"
    # @conn.headers['Accept-Encoding'] = 'gzip'
    #need to decode gzipped responses
  end

  def full_season_schedule
    season_name = "2014-2014-regular"
    url = "/v1.1/pull/nfl/#{season_name}/full_game_schedule.json"
    response = conn.get(url)
    
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def daily_player_stats(date)
    season = "2014-2014-regular"
    positions = 'qb,wr,rb,te'
    url = "/v1.1/pull/nfl/#{season}/daily_player_stats.json?fordate=#{date}&position=#{positions}"
    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader:conn
end