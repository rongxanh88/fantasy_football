FactoryGirl.define do
  factory :football_player do
    sequence(:api_id) { |n| "#{n}" }
    first_name 'Aaron'
    last_name  'Rodgers'
    position   'QB'
    team       'GB'
    expected_point_production "30.0"
    salary "4000"
  end
end
