class AddTeamToFootbalPlayer < ActiveRecord::Migration[5.1]
  def change
    add_column :football_players, :team, :text
  end
end
