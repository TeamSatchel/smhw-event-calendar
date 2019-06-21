class EventSerializer
  attr_reader :event

  def initialize(event)
    @event = event
  end

  def as_json
    {
      id: event.id,
      title: event.title,
      resourceId: event.calendar_id,
      description: event.description,
      start: event.start_date,
      end: event.end_date,
      color: event.calendar.color
    }
  end
end
