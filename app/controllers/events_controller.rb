class EventsController < ApplicationController
  def index
    @events = Event.where(start_date: params[:start]..params[:end])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
  end

  private
    #Whitelisted attributes to prevent incorrect exposing of data
    def event_params
      params.require(:event).permit(:title, :description, :start_date, :end_date)
    end
end
