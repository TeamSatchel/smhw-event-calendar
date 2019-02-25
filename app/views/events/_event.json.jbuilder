date_format = '%Y-%m-%dT%H:%M:%S'

json.id event.id
json.title event.title
json.description event.description
json.start event.start_date.strftime(date_format)
json.end event.end_date.strftime(date_format)


json.update_url event_path(event, method: :patch)
json.edit_url edit_event_path(event)
