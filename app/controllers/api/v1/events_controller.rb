class Api::V1::EventsController < Api::BaseController

  def index
    json_respond(events, Api::V1::EventsRepresenter)
  end

  def create
    event = Event.create(event_params)
    json_respond(event, Api::V1::EventRepresenter, 201)
  end

  private

  def events
    Event.all
  end

  def event_params
    params.permit(:description, :start_date, :end_date, :title)
  end
end
