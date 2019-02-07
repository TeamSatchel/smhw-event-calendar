class EventsController < ApplicationController
  def index
    current_week = (Date.current.beginning_of_week..Date.current.end_of_week)
    @events = Event.where(begins: current_week)
    @days_of_week = current_week.to_a
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    respond_to do |format|
      format.html
      format.json { render json: @event.to_json }
    end
  end

  private

  def event_params
     params.require(:event).permit!
   end
end
