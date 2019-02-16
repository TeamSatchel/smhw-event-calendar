class EventsController < ApplicationController
  def index
    @events = Event.on_current_week.to_a
  end

  def create
    event = Event.new(
      start_date: params[:start_date],
      end_date: params[:end_date],
      description: params[:description]
    )
    begin
      event.save!
      content = event
      status  = :created
    rescue StandardError
      content = { errors: error_messages(event) }
      status  = :bad_request
    ensure
      render json: content, status: status
    end
  end
end
