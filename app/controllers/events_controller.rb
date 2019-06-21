class EventsController < ApplicationController

  def index
    @events = Event.includes(:calendar).map do |event|
      EventSerializer.new(event).as_json
    end
    @calendars = Calendar.all
  end

  def create
    event = Event.new(event_params)

    if event.save
      render json: { event: EventSerializer.new(event).as_json}, status: :created
    else
      render json: { errors: event.errors.full_messages.join(', ')}, status: :unprocessable_entity
    end
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :start_date, :end_date, :calendar_id)
  end
end
