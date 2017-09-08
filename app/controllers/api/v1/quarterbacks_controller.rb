class Api::V1::QuarterbacksController < ApplicationController
  def index
    @quarterbacks = FootballPlayer.position("QB")
  end
end
