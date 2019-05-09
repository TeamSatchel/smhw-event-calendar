class EventsController < ApplicationController
  # GET /events
  def index
    @events = Event.where(start_date: params[:start]..params[:end]).
      or(Event.where(end_date: params[:start]..params[:end])).
      or(Event.where('start_date <= ? AND end_date >= ?', params[:start], params[:end]))
  end

  def new
    @event = Event.new
    respond_to { |format| format.js { render layout: false } }
  end

  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.save
    respond_to { |format| format.js { render layout: false } }
  end

  private

  def event_params
    params.fetch(:event, {}).permit(:title, :description, :start_date,
      :end_date, :date_range, :start_time, :end_time)
  end
end
