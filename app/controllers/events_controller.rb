class EventsController < ApplicationController
  def index
    @events = EventsService.events
  end

  def create
    new_event = EventsService.new_event(params)
    errors    = event_errors(new_event)
    if !errors
      content = new_event
      status  = :created
    else
      content = { errors: errors }
      status  = :bad_request
    end
    render json: content, status: status
  end

  private

  def event_errors(event)
    errors = event.errors
    errors.full_messages.join(', ') unless errors.empty?
  end
end
