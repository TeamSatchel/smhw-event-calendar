class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      head :created
    else
      head 422
    end
  end

  private

  def event_params
    params.require(:event)
          .permit(:start_at, :end_at, :description, :date_range)
  end

end
