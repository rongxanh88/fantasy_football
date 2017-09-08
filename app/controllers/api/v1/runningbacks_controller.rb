class Api::V1::RunningbacksController < ApplicationController
  def index
    @runningbacks = FootballPlayer.position("RB")
  end
end
