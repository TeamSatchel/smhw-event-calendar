class EventsController < ApplicationController
  # GET /events
  def index
    @events = Event.where(start_date: params[:start]..params[:end])
  end

  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.json { render :show, status: :created, location: @event }
      else
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def event_params
    params.fetch(:event, {}).permit(:title, :description, :start_date,
      :end_date, :date_range, :start_time, :end_time)
  end
end
