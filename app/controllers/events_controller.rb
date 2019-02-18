class EventsController < ApplicationController
  helper_method :events

  def index
    json_response(events)
  end

  def create
    event = Event.create(event_params)
    json_response(event, :created)
  end

  private

  def events
    Event.all
  end

  def event_params
    params.require(:event).permit(:description, :start_time, :end_time)
  end
end
