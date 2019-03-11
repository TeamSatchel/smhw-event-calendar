class EventsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json do
        render json: { success: 1, result: ActiveModelSerializers::SerializableResource.new(events) }
      end
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :end_date)
  end

  def events
    start_date = Time.at(params[:from].to_i / 1000)
    end_date = Time.at(params[:to].to_i / 1000)

    Event.where('(start_date >= ? AND start_date <= ?) OR (end_date >= ? AND end_date <= ?)',
                start_date, end_date, start_date, end_date)
  end
end
