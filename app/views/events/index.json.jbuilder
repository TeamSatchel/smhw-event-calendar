json.array! @events do |event|
  json.title event[:title]
  json.description sanitize event[:description]
  json.start event[:start_at]
  json.end event[:end_at] + 1.day
end
