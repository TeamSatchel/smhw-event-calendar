class EventsController < ApplicationController
  def index
    @event = Event.new
    respond_to do |format|
      format.html
      format.json do
        @events = Event.between_dates(params[:start], params[:end])
      end
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to action: :index
    else
      render :index
    end
  end

  private

    def event_params
      params.require(:event).permit(:title, :subject, :description, :start_date, :end_date)
    end
end
