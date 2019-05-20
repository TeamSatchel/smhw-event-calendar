class EventsController < ApplicationController

  def index
    @event = Event.new(start_date: Time.current, end_date: Time.current.advance(hours: 3))

    respond_to do |format|
      format.html
      format.json { render json: Event.all.map(&:as_json_for_calendar) }
    end
  end

  def create
    result = Event::Create.new(event: event_params, user: current_user).call

    @event = result.event

    if result.success?
      redirect_to root_path, success: "Event created"
    else
      present_errors(result)
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:description, :start_date, :end_date)
  end

end
