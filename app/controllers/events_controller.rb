# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @new_event = Event.new

    respond_to do |format|
      format.json { json_response(serialized_events) }
      format.html
    end
  end

  def create
    event = Event.new(permitted_params)
    return json_response(message: t('alerts.notices.event.saved')) if event.save

    json_response(event.errors.full_messages, :unprocessable_entity)
  end

  private

  def json_response(response, status = :ok)
    render json:   response,
           status: status
  end

  def permitted_params
    params.require(:event)
          .permit(:title, :description, :start_date, :end_date)
  end

  def serialized_events
    Event.date_ranged(params.slice(:start, :end)).serialize
  end
end
