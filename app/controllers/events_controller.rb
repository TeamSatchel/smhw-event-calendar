class EventsController < ApplicationController
  def index
		@events = events_with_inclusive_and_at
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

  def events_with_inclusive_and_at
    Event.all.each{ |e| e[:end_at] = (e[:end_at] + 1.day) }
  end
end
