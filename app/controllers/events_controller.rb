class EventsController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json { render json: Event.all.map(&:as_json_for_calendar) }
    end
  end

  def new
    @event = Event.new(start_date: Time.current, end_date: Time.current.advance(hours: 3))

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    result = Event::Create.new(event: event_params, user: current_user).call

    @event = result.event

    respond_to do |format|
      format.html do
        if result.success?
          redirect_to root_path, success: "Event created"
        else
          present_errors(result)
          render :new
        end
      end

      format.js do
        if result.success?
          render :success_create
        else
          render :failure_create
        end
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :end_date)
  end

end
