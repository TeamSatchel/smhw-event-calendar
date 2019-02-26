class Event < ActiveRecord::Base

  # Returns Event duration in days
  def duration
    (self.end_date.to_date - self.start_date.to_date).to_i + 1
  end

  # Static method that returns an events hash
  # indexed by start_date
  def self.get_events
    sorted = {}
    events = Event.order :start_date
    events.each do |event|
      sorted[event.start_date.to_date] = event
    end
     sorted
  end

end
