json.receivers @receivers.each do |receiver|
  json.id receiver.api_id
  json.first_name receiver.first_name
  json.last_name receiver.last_name
  json.position receiver.position
  json.expected_point_production receiver.expected_point_production
  json.salary receiver.salary
end