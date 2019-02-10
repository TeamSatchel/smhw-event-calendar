class EventsController < ApplicationController
  def index
    render json: Event.current_week.map(&:serialize)
  end

  def create
    event = Event.new permit_params

    if event.save
      render json: event.serialize
    else
      render json: event.errors.full_messages.join(", "), status: :unprocessable_entity
    end
  end

  private

  def permit_params
    params.require(:event).permit(:start_at, :end_at, :title)
  end
end
