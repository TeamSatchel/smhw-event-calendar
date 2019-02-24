class EventsController < ApplicationController
  def index
    @events = Events::PresenterService.events
  end

  def create
    event_service = Events::CrudService.new_event(params)
    if !event_service.errors?
      content = event_service.event
      status  = :created
    else
      content = { errors: event_service.error_messages }
      status  = :bad_request
    end
    render json: content, status: status
  end

  def update
    Events::CrudService.update_event(params)
  end
end
