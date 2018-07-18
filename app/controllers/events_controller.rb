class EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Event.ordered
  end

  def create
    event = Event.new event_params

    if event.save
      render json: event, status: :created
    else
      render json: { errors: event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit :title, :location, :description, :start_date,
      :end_date
  end
end
