class Api::V1::RunningbacksController < ApplicationController
  def index
    @runningbacks = FootballPlayer.where(position: "RB")
  end
end
