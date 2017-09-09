require 'rails_helper'

RSpec.describe FootballPlayer, type: :model do
  describe "valid attributes" do
    it { should validate_presence_of(:api_id) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:position) }
    it { should validate_presence_of(:expected_point_production) }

    it { should validate_uniqueness_of(:api_id) }
  end

  describe "FootballPlayer Methods" do
    it "returns a full name for a player" do
      player = build(:football_player)
      fn     = player.first_name
      ln     = player.last_name

      assert(player.full_name, fn + " " + ln)
    end
  end
end
