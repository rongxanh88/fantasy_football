class Api::V1::ReceiversController < ApplicationController
  def index
    @receivers = FootballPlayer.position("WR")
  end
end
