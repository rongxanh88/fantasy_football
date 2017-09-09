FactoryGirl.define do
  factory :football_player do
    sequence(:api_id) { |n| "#{n}" }
    first_name 'Terrell'
    last_name  'Davis'
    position   'RB'
    team       'DEN'
    expected_point_production "30.0"
  end
end
