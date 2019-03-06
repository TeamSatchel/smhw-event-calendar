class EventDecorator < Draper::Decorator
  delegate_all

  def js_event_format
    {
        id: self.id,
        start: self.event_start.strftime("%Y-%m-%dT%H:%M:00"),
        end: self.event_end.strftime("%Y-%m-%dT%H:%M:00"),
        title: self.description.to_s,
        editable: false
    }.to_json
  end

end
