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

  def full_season_schedule(season)
    url = "/v1.1/pull/nfl/#{season}/full_game_schedule.json"
    response = conn.get(url)
    
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def daily_player_stats(date)
    year = date[0..3]
    month = date[4..5]
    if month == "01"
      year = (year.to_i - 1).to_s
    end
    season = "#{year}-#{year}-regular"
    positions = 'qb,wr,rb,te'
    url = "/v1.1/pull/nfl/#{season}/daily_player_stats.json?fordate=#{date}&position=#{positions}"
    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :conn
end