require 'rails_helper'

RSpec.describe Defense, type: :model do
  describe "valid attributes" do
    it { should validate_presence_of(:api_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:expected_point_production) }

    it { should validate_uniqueness_of(:api_id) }
    it { should validate_uniqueness_of(:name) }
  end

  describe "Defense Methods" do
    it "saves all defenses to DB" do
      attrs  = { ID: "1", Name: "Denver Broncos"} 
      attrs2 = { ID: "2", Name: "Buffalo Bills" }
      defense1 = DefStatGenerator.new(attrs)
      defense2 = DefStatGenerator.new(attrs2)
      defense1.add_points("20.0")
      defense1.add_points("30.0")
      defense2.add_points("10.0")
      defense2.add_points("20.0")
      defenses = { "1": defense1, "2": defense2 }
      Defense.save_all(defenses)

      assert(Defense.count, 2)
    end
  end
end
