class EventsController < ApplicationController
  def index
    @current_time = Time.now
    @calendar_type = EventCalendar::Types::Week.new(@current_time)
    @events = EventManager.new(Event, @calendar_type).get_all_calendar_events
    @calendar = EventCalendar::Calendar.new(@calendar_type, @events)
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save

      @current_time = Time.now
      @calendar_type = EventCalendar::Types::Week.new(@current_time)
      @events = EventManager.new(Event, @calendar_type).get_all_calendar_events

      @events_html = render_to_string partial: 'event_list', locals: { events: @events }, formats: [:html]

      respond_to do |format|
        format.json { render json: { events: @events_html }, status: :created }
      end
    else
      respond_to do |format|
        format.json {render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_at, :end_at, :description)
  end
end
