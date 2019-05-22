class EventsController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json { render json: Event.all.to_a }
    end
  end

  # POST /events
  def create
    event = Event.new( event_params )
    event.save!

    respond_to do |format|
      format.js# { head :ok }
    end
  end

  private

  def event_params
    params.require( :event ).permit( :start_date, :end_date, :description )
  end
end
