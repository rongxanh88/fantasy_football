require 'base64'
require 'faraday'
require 'json'
require 'pry'

class SportsFeedService

  def initialize
    
  end

  def full_season_schedule
    sports_feed_login = 'rongxanh88'
    sports_feed_pw    = 'avsrule'
    # https://api.mysportsfeeds.com/v1.1/pull/nfl/{season-name}/full_game_schedule
    # authorization = "#{ENV['sports_feed_login']}:#{ENV['sports_feed_pw']}"
    authorization = "#{sports_feed_login}:#{sports_feed_pw}"
    encoded_authorization = Base64.encode64(authorization)
    season_name = "2014-2017-regular"
    url = "https://api.mysportsfeeds.com/v1.1/pull/nfl/#{season_name}/full_game_schedule.json"
    # binding.pry
    conn = Faraday.new(url: url)

    response = conn.get do |req|
      req.headers['Authorization'] = "Basic #{encoded_authorization}"
    end

    JSON.parse(response.body)
  end
end

service = SportsFeedService.new
result = service.full_season_schedule
binding.pry