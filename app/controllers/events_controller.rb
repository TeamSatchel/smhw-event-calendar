class EventsController < ApplicationController
  def index
    @event = Event.new
    respond_to do |format|
      format.html
      format.json do
        start_date = parse_date(params[:start])
        end_date = parse_date(params[:end])

        events = []
        events = Event.between_dates(start_date, end_date) if end_date.present? && end_date.present?

        render json: events
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

    def parse_date(date)
      begin
        Date.parse(date)
      rescue e
        nil
      end
    end
end
