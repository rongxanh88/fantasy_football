require 'base64'
require 'faraday'
require 'json'

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
    season = parse_season_from(date)
    positions = 'qb,wr,rb,te'
    url = "/v1.1/pull/nfl/#{season}/daily_player_stats.json?fordate=#{date}&position=#{positions}"
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def daily_fantasy_points(date)
    season = parse_season_from(date)
    url = "/v1.1/pull/nfl/#{season}/daily_dfs.json?fordate=#{date}"
    response = conn.get(url)
    result = JSON.parse(response.body, symbolize_names: true)
    result = result[:dailydfs]
  end

  private
    attr_reader :conn

    def parse_season_from(date)
      yr = date[0..3]
      mnth = date[4..5]
      season = ""
      prev_yr = (yr.to_i - 1).to_s
      nxt_yr = (yr.to_i + 1).to_s

      mnth == "01" ? season += "#{prev_yr}-#{yr}" : season += "#{yr}-#{nxt_yr}"

      season = "#{yr}" if (yr == "2014")

      season += "-regular"
    end
end