class CreateWeeklyGames < ActiveRecord::Migration[5.1]
  def change
    create_table :weekly_games do |t|

      t.timestamps
    end
  end
end
