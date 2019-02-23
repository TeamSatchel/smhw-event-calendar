json.array! @events do |event|
  json.(event, :title, :subject, :description)
  json.start event.start_date.beginning_of_day
  json.end event.end_date.end_of_day
end
