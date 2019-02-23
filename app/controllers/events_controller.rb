class EventsController < ApplicationController
  def index
    @event = Event.new
    respond_to do |format|
      format.html
      format.json do
        render json: Event.between_dates(params[:start], params[:end])
      end
    end
  end

  def create
    event = Event.new(event_params)
    if event.save
      render json: event, status: :created
    else
      render json: event.errors.messages, status: :unprocessable_entity
    end
  end

  private

    def event_params
      params.require(:event).permit(:title, :subject, :description, :start_date, :end_date)
    end
end
