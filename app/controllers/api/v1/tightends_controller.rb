class Api::V1::TightendsController < ApplicationController
  def index
    @tightends = FootballPlayer.position("TE")
  end
end
