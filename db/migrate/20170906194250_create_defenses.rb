class CreateDefenses < ActiveRecord::Migration[5.1]
  def change
    create_table :defenses do |t|
      t.text :api_id
      t.text :name
      t.text :expected_point_production

      t.timestamps
    end
  end
end
