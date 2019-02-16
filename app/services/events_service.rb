class EventsService
  class << self
    def events
      Event.on_current_week.to_a
    end

    def new_event(params)
      event = Event.new(
        start_date: params[:start_date],
        end_date: params[:end_date],
        title: params[:title],
        description: params[:description],
        signature: params[:signature]
      )
      event.save
      event
    end
  end
end
