class EventsController < ApplicationController
  def index
    @events = Event.all

    render json: @events
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: :created
    else
      render json: @event, status: :unprocessable_entity, serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  private

  def event_params
    ActiveModelSerializers::Deserialization.jsonapi_parse!(params, only: [:description, :start_date, :end_date])
  end
end
