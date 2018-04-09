class EventsController < ApplicationController
  def index
    @event = Event.default_form_data

    @events = Event.current_week_events

    @week_start = Date.today.at_beginning_of_week
    @week_end = @week_start + 6.days
  end

  def create
    respond_to do |format|
      @event = Event.new event_params
      if @event.save
        flash[:success] = 'done!'
      else
        flash[:error] = 'failed.'
      end
      format.html { redirect_to root_url }
      format.js
    end
  end

  private
  def event_params
    params.require(:event).permit(:title, :start_date, :end_date)
  end
end
