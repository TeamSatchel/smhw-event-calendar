class EventsController < ApplicationController
  helper_method :events

  def index
    json_response(events)
  end

  def create
    event = Event.create!(event_params)
    json_response(event, :created)
  end

  private

  def events
    events = Event.all
    if params[:from_date]
      events =
        events.where('DATE(start_time) >= ?', Date.parse(params[:from_date]))
    end
    if params[:to_date]
      events =
        events.where('DATE(end_time) <= ?', Date.parse(params[:to_date]))
    end
    events
  end

  def event_params
    params.require(:event).permit(:description, :start_time, :end_time)
  end
end
