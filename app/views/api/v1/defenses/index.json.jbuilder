json.defenses @defenses.each do |defense|
  json.id defense.api_id
  json.name defense.name
  json.expected_point_production defense.expected_point_production
  json.salary defense.salary
end