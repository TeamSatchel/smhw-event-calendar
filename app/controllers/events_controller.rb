class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      respond_to do |format|
        format.js
      end
      redirect_back fallback_location: '', notice: '😅 Event has been added successfully!'
    else
      respond_to do |format|
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_time, :end_time)
  end

end
