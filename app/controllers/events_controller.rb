class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create!(allowed_params)
    @events = Event.all
  end

  private

  def allowed_params
    params.require(:event).permit(:description, :start_at, :end_at)
  end
end
