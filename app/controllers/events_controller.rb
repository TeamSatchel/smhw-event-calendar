class EventsController < ApplicationController
  # GET /events
  def index
    @events = Event.where(start_date: params[:start]..params[:end])
  end

  def new
    @event = Event.new
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.json { render :show, status: :created, location: @event }
      else
        format.js { render layout: false }
      end
    end
  end

  private

  def event_params
    params.fetch(:event, {}).permit(:title, :description, :start_date,
      :end_date, :date_range, :start_time, :end_time)
  end
end
