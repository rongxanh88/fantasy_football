class Api::V1::ReceiversController < ApplicationController
  def index
    @receivers = FootballPlayer.where(position: "WR")
  end
end
