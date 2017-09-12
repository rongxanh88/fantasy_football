class Api::V1::QuarterbacksController < ApplicationController
  def index
    @quarterbacks = Rails.cache.fetch("qb_cache", expires_in: 30.minutes) do
      FootballPlayer.position("QB")
    end
  end
end
