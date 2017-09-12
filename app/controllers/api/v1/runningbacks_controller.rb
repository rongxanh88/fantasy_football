class Api::V1::RunningbacksController < ApplicationController
  def index
    @runningbacks = Rails.cache.fetch("rb_cache", expires_in: 30.minutes) do
      FootballPlayer.position("RB")
    end
  end
end
