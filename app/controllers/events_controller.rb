class EventsController < ApplicationController
  def index
    @events = ActiveModelSerializers::SerializableResource.new(Event.all)
  end

  def create
    @event = Event.create(event_params)
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :end_date)
  end
end
