class FFNerdService

    def initialize
      @api_key = ENV['ff_nerd_api_key']
      @conn    = Faraday.new(url: "https://www.fantasyfootballnerd.com")
    end

    def active_players_by_position(position)
      url = "/service/players/json/#{api_key}/#{position}/"
      response = conn.get(url)
      result = JSON.parse(response.body, symbolize_names: true)
      result = result[:Players].map { |player| player[:displayName] }
    end

    def injured_players
      url = "/service/injuries/json/#{api_key}/"
      response = conn.get(url)
      result = JSON.parse(response.body, symbolize_names: true)
      result = result[:Injuries].map { |team, players| players }.flatten
                                .map { |player| player[:playerName] }
    end

    def active_players_by_team(position)
      url = "/service/players/json/#{api_key}/#{position}/"
      response = conn.get(url)
      result = JSON.parse(response.body, symbolize_names: true)
      result = result[:Players].map do |player|
        [player[:displayName], player[:team]]
      end
    end

    private

    attr_reader :api_key, :conn
end