class Api::V1::TightendsController < ApplicationController
  def index
    @tightends = FootballPlayer.where(position: "TE")
  end
end
