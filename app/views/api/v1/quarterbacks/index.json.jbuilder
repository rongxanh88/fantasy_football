json.quarterbacks @quarterbacks.each do |qb|
  json.id                        qb.api_id
  json.first_name                qb.first_name
  json.last_name                 qb.last_name
  json.position                  qb.position
  json.expected_point_production qb.expected_point_production
  json.salary                    qb.salary
end