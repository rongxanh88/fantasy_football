FactoryGirl.define do
  factory :defense do
    sequence(:api_id) { |n| "#{n}" }
    name "DEN"
    expected_point_production "30.0"
  end
end
