class EventsController < ApplicationController
  def index
    @events = EventsService.events
  end

  def create
    new_event = Events::Creator.new_event(params)
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
    event = Event.find(params[:id])
    event.update(permit_attributes)
  end

  private

  def permit_attributes
    params.permit(:start_date, :end_date, :title, :description, :signature)
  end
end
