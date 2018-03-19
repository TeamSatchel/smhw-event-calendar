class EventsController < ApplicationController
  def index
    @week = DateTime.current.beginning_of_week..DateTime.current.end_of_week
    @events = Event.actual
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      render json: { notice: "Event created!" }
    else
      render json: @event.errors.full_messages.join(", "), status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:start_date, :end_date, :description)
  end

end
