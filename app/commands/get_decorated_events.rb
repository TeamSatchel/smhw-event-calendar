class GetDecoratedEvents < Rectify::Command
  def initialize(events)
    @events = events
  end

  def call
    create_events_array
  end

  private

  attr_reader :events

  def create_events_array
    decorated_events = []
    events.each do |e|
      event="
	  			{
	  				id: \"#{e.id}\",
	          title: \"#{e.description}\",
	  				start: \"#{e.event_start.strftime("%Y-%m-%dT%H:%M:00")}\",
	  				start: \"#{e.event_end.strftime("%Y-%m-%dT%H:%M:00")}\",
	          editable: false
	  			}"  
			decorated_events.push event
		end
    decorated_events
    
  end
  
end