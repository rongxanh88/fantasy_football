class Api::V1::ReceiversController < ApplicationController
  def index
    @receivers = Rails.cache.fetch("wr_cache", expires_in: 30.minutes) do
      FootballPlayer.position("WR")
    end
  end
end
