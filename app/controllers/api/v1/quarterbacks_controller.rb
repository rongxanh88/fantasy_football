class Api::V1::QuarterbacksController < ApplicationController
  def index
    @quarterbacks = FootballPlayer.quarterbacks
  end
end
