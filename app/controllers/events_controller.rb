class EventsController < ApplicationController

  def index
    @events = Event.all
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :end_date)
  end
end
