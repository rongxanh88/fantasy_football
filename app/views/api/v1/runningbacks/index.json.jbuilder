json.runningbacks @runningbacks.each do |back|
  json.id back.api_id
  json.first_name back.first_name
  json.last_name back.last_name
  json.position back.position
  json.expected_point_production back.expected_point_production
  json.salary back.salary
end