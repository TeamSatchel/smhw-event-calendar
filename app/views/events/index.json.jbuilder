json.array! @events do |event|
  json.extract! event, :title
  json.start event[:starts_at]
  json.end event[:ends_at]
end
