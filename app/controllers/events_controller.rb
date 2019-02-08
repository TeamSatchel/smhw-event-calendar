class EventsController < ApplicationController
  def index
    current_week = (Date.current.beginning_of_week..Date.current.end_of_week)
    @events = Event.where(begins: current_week)
    @days_of_week = current_week.to_a
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    respond_to do |format|
      format.html
      format.json { render json: @event.to_json }
    end
  end

  private

  def event_params
    [:begins, :ends].each do |date_attr|
      next unless params.key?(:event)
      date_str = params[:event].fetch(date_attr, Date.current.strftime('%m/%d/%Y'))
      params[:event][date_attr] = Date.strptime(date_str, '%m/%d/%Y')
    end
    params.require(:event).permit!
  end
end
