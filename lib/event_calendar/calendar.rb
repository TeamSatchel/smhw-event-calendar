module EventCalendar
  class Calendar
    attr_reader :calendar_type, :events

    def initialize(calendar_type, events)
      @calendar_type = calendar_type
      @events = events
    end

    def to_partial_path
      "_calendar/#{@calendar_type.type}"
    end
  end
end