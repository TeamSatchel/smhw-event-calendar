json.array! @events do |event|
  json.id event.id
  json.title event.title
  json.description event.description
  json.start event.start_date.strftime('%Y-%m-%dT%H:%M:%S')
  json.end event.end_date.strftime('%Y-%m-%dT%H:%M:%S')
end