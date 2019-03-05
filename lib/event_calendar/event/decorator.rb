module EventCalendar
  module Event
    class Decorator < SimpleDelegator
      def initialize(event, calendar_type)
        super(event)
        @calendar_type = calendar_type
      end

      def event_start_at_position_identifier
        @calendar_type.event_start_at_position_identifier(self)
      end

      def event_length_of_visible
        @calendar_type.event_length_of_visible(self)
      end

      def event_in_past?
        end_at.to_date.past?
      end
    end
  end
end
