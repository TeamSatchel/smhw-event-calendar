class EventsController < ApplicationController
  def index
    @events = Events::PresenterService.events
  end

  def create
    new_event = Events::BaseService.new_event(params)
    if new_event.errors.empty?
      content = new_event
      status  = :created
    else
      content = { errors: new_event.errors }
      status  = :bad_request
    end
    render json: content, status: status
  end

  def update
    Events::BaseService.update_event(params)
  end
end
