class AddSalarytoFootballPlayer < ActiveRecord::Migration[5.1]
  def change
    add_column :football_players, :salary, :text
    add_column :defenses, :salary, :text
  end
end
