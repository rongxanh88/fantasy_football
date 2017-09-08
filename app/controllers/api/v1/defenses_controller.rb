class Api::V1::DefensesController < ApplicationController
  def index
    @defenses = Defense.all
  end
end
