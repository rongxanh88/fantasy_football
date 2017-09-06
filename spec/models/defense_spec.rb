require 'rails_helper'

RSpec.describe Defense, type: :model do
  describe "valid attributes" do
    it { should validate_presence_of(:api_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:expected_point_production) }

    it { should validate_uniqueness_of(:api_id) }
    it { should validate_uniqueness_of(:name) }
  end
end
