class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    start_datetime = DateTime.parse(params[:start].to_s) rescue nil
    end_datetime = DateTime.parse(params[:end].to_s) rescue nil

    @events = Event.where(start: start_datetime..end_datetime)
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.save
  end

  def update
    @event.update(event_params)
  end

  def destroy
    @event.destroy
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :desc, :start, :end, :all_day)
    end
end
