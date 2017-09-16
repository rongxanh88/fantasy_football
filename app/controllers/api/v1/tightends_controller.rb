class Api::V1::TightendsController < ApplicationController
  def index
    @tightends = Rails.cache.fetch("te_cache", expires_in: 30.minutes) do
      FootballPlayer.position("TE")
    end
  end
end
