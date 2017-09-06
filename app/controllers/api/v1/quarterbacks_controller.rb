class Api::V1::QuarterbacksController < ApplicationController
  def index
    @quarterbacks = FootballPlayer.where(position: "QB")
  end
end
