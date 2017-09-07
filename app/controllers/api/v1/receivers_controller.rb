class Api::V1::ReceiversController < ApplicationController
  def index
    # @receivers = FootballPlayer.where(position: "WR")
    @receivers = FootballPlayer.receivers
  end
end
