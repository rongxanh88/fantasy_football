ActiveRecord::Schema.define(version: 20170907224850) do
  enable_extension "plpgsql"

  create_table "defenses", force: :cascade do |t|
    t.text "api_id"
    t.text "name"
    t.text "expected_point_production"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "football_players", force: :cascade do |t|
    t.text "api_id"
    t.text "first_name"
    t.text "last_name"
    t.text "position"
    t.decimal "expected_point_production"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "team"
  end

end
