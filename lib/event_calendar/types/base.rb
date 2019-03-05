module EventCalendar
  module Types
    class Base
      class EventCalendarTypeBaseException < RuntimeError; end

      def initialize(time)
        @time = time
      end

      def type
        raise EventCalendarTypeBaseException.new('Method `type` must be implemented all successions')
      end

      def range_identifier
        raise EventCalendarTypeBaseException.new('Method `range_identifier` must be implemented all successions')
      end

      def event_start_at_position_identifier
        raise EventCalendarTypeBaseException.new('Method `event_start_at_position_identifier` must be implemented all successions')
      end

      def event_length_of_visible
        raise EventCalendarTypeBaseException.new('Method `event_length_of_visible` must be implemented all successions')
      end
    end
  end
end