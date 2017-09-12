require 'csv'

class Api::V1::SalariesController < ApplicationController
  def index
    salary_file = csv_params.tempfile
    contents = CSV.open(salary_file, headers: true, header_converters: :symbol)

    contents.each do |row|
      if row[:position] != "DST"
        full_name = row[:name].split(' ')
        first_name = full_name[0]
        last_name = full_name[1]

        player = FootballPlayer.find_by(first_name: first_name, last_name: last_name)

        if player
          player.salary = row[:salary]
          player.save
        end
      elsif row[:position] == "DST"
        defense = Defense.find_by(name: row[:name].chop)

        if defense
          defense.salary = row[:salary]
          defense.save
        end
      end
    end

    render json: { status: 200 }
  end

  private

    def csv_params
      params.require(:salaryData)
    end
end
