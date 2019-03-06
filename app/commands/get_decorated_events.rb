class GetDecoratedEvents < Rectify::Command
  def initialize(events)
    @events = events
  end

  def call
    broadcast(:ok, create_events_array)
  end

  private

  attr_reader :events

  def create_events_array
    decorated_events = []
    @events.each do |e|
      event = Hash.new
      event[:id] = e.id.to_s
      event[:title] = e.description.to_s
      event[:start] = e.event_start.strftime("%Y-%m-%dT%H:%M:00")
      event[:end] = e.event_end.strftime("%Y-%m-%dT%H:%M:00")
      event[:editable] = false
			decorated_events.push event.to_json
		end
    decorated_events
  end
  
end