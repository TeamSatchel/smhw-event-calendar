class EventsController < ApplicationController
  respond_to :html, :json

  def index
    @events = Event.all
    respond_with(@events)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
  end

  private

  def event_params
    params.require(:event)
          .permit(:start_at, :end_at, :description, :date_range)
  end

end
