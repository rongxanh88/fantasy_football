json.tightends @tightends.each do |tightend|
  json.id tightend.api_id
  json.first_name tightend.first_name
  json.last_name tightend.last_name
  json.position tightend.position
  json.expected_point_production tightend.expected_point_production
end