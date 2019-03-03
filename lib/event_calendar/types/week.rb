module EventCalendar
  module Types
    class Week < Base
      def type
        :week
      end

      def range_identifier
        @time.to_date.cweek
      end

      def date_range
        Date.commercial(@time.year, range_identifier).all_week
      end

      def event_start_at_position_identifier(event)
        day_identifier = event.start_at.to_date.cwday
        day_identifier = 0 if event.start_at.to_date < date_range.first
        day_identifier
      end

      def event_length_of_visible(event)
        days_count = (event.start_at.to_date..event.end_at.to_date).count

        range_overflow = 0
        range_overflow = (date_range.last..event.end_at.to_date).count - 1 if event.end_at.to_date > date_range.last
        range_overflow += (event.start_at.to_date..date_range.first).count - 1 if event.start_at.to_date < date_range.first

        days_count -= range_overflow if range_overflow > 0

        days_count
      end
    end
  end
end