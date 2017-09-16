require 'csv'

class Api::V1::SalariesController < ApplicationController
  def index
    salary_file = csv_params.tempfile
    contents = CSV.open(salary_file, headers: true, header_converters: :symbol)

    contents.each do |row|
      if row[:position] != "DST"
        FootballPlayer.update_player_salary(row[:name], row[:salary])
      elsif row[:position] == "DST"
        Defense.update_defense_salary(row[:name].chop, row[:salary])
      end
    end

    render json: { status: 200 }
  end

  private

    def csv_params
      params.require(:salaryData)
    end

end
