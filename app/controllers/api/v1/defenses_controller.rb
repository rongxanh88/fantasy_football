class Api::V1::DefensesController < ApplicationController
  def index
    @defenses = Rails.cache.fetch("def_cache", expires_in: 30.minutes) do
      Defense.get_all
    end
  end
end
