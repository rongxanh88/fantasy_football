class Defense < ApplicationRecord
  validates :api_id, :name, :expected_point_production, presence: true
  validates  :api_id, :name, uniqueness: true
end
