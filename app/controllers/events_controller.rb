class EventsController < ApplicationController
  def index
    @events = ActiveModelSerializers::SerializableResource.new(Event.all)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @events = ActiveModelSerializers::SerializableResource.new(Event.all) if @event.save
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :end_date)
  end
end
