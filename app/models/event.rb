class Event < ActiveRecord::Base

  validates :start_date, :presence => true
  validates :end_date, :presence => true
  validates :description, :presence => true
  validate :dates_should_be_in_current_week
  validate :start_date_shouldnt_be_greater_than_end_date
  validate :events_shouldnt_overlap, :on => :create

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

  def events_dont_overlap
    overlap = Event.where(
      "(start_date <= ? AND end_date >= ?)",
      end_date, start_date
    )
    !overlap.empty?
  end

  # Custom validators

  def dates_should_be_in_current_week
    if start_date.to_date < EventCalendar::WEEK_START_DATE || end_date.to_date > EventCalendar::WEEK_END_DATE
      errors.add 'dates', 'should be in current week'
    end
  end

  def start_date_shouldnt_be_greater_than_end_date
    if end_date.to_date < start_date.to_date
      errors.add 'start date', 'shouldnt be greater than end date'
    end
  end

  def events_shouldnt_overlap
    if events_dont_overlap
      errors.add 'events', 'shouldn\'t overlap'
    end
  end

end
