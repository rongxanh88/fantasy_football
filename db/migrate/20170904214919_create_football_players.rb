class CreateFootballPlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :football_players do |t|
      t.text :api_id
      t.text :first_name
      t.text :last_name
      t.text :position
      t.decimal :expected_point_production

      t.timestamps
    end
  end
end
