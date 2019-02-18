class EventsService
  class << self
    def events
      Event.on_current_week.to_a
    end

    def new_event(params)
      event = Event.new(
        start_date: parse_date(params[:start_date]),
        end_date: parse_date(params[:end_date]),
        title: params[:title],
        description: params[:description],
        signature: params[:signature]
      )
      event.save
      event
    end

    private

    def parse_date(date)
      Date.iso8601(date.to_s)
    rescue ArgumentError
      nil
    end
  end
end
