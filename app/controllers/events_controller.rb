class EventsController < ApplicationController
  def index
    @events = Event.on_current_week
  end

  def create
    event = Event.new(
      start_date: params[:start_date],
      end_date: params[:end_date],
      description: params[:description]
    )
    event.save!
    event
  end
end
