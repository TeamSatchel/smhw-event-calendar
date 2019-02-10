class EventsController < ApplicationController
  def index
    @events = Event.current_week
    today = Date.today
    @end_of_week = today.at_end_of_week
    @beginning_of_week = today.at_beginning_of_week
  end

  def create
    event = Event.new permit_params

    if event.save
      render json: event.serialize
    else
      render json: nil
    end
  end

  private

  def permit_params
    params.require(:event).permit(:start_at, :end_at, :title)
  end
end
