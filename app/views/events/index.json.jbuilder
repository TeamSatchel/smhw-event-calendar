json.array! @events do |event|
  date_format = event.all_day_event? ? Event::DATE_FORMAT : Event::DATETIME_FORMAT
  json.id event.id
  json.title event.description
  json.start event.start_at.strftime(date_format)
  json.end event.end_at.strftime(date_format)
end