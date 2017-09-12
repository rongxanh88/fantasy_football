class Api::V1::DefensesController < ApplicationController
  def index
    @defenses = Defense.get_all
  end
end
