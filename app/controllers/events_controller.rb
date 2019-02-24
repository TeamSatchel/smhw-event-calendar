class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|

      format.html
      format.json { render json: @events }

    end

  end
  # POST /events
  # POST /events.json
  def create

  end



  private
     def event_params
      params.require(:event).permit(:title, :description, :start_date, :end_date)
    end
end
