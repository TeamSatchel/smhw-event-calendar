date_format = event.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'
json.id event.id
json.title event.title
json.description event.description
json.start event.start_date.strftime(date_format)
json.end event.end_date.strftime(date_format)