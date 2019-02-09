class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def create
    @event_record = Event.new(event_params)

    if @event_record.save
      render json: @event_record, status: :ok
    else
      render json: @event_record.errors, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_at, :end_at)
  end
end
