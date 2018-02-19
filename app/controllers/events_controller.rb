class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save!
        format.html { redirect_to action: :index }
        format.js {}
      else
        format.html { redirect_to action: :index }
      end
    end
  end

  private

  def event_params
    params
      .require(:event)
      .permit(
        :description,
        :start_date,
        :end_date
      )
  end
end
