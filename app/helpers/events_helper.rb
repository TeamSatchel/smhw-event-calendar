module EventsHelper
  CSS_CLASS_WIDTH_PREFIX = 'col-width-day-'
  CSS_CLASS_OFFSET_PREFIX = 'offset-left-day-'
  CSS_CLASS_EVENT_IN_PAST = 'past'

  def get_css_classes(event, calendar_type)
    decorated_event = EventCalendar::Event::Decorator.new(event, calendar_type)

    classes = []

    classes << "#{CSS_CLASS_OFFSET_PREFIX}#{decorated_event.event_start_at_position_identifier}"
    classes << "#{CSS_CLASS_WIDTH_PREFIX}#{decorated_event.event_length_of_visible}"

    classes << CSS_CLASS_EVENT_IN_PAST if decorated_event.event_in_past?

    " #{classes.join(' ')}"
  end
end
