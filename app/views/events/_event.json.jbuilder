json.extract! event, :id, :title, :description
json.start event.start_date
json.end event.end_date
json.url event_url(event, format: :html)
