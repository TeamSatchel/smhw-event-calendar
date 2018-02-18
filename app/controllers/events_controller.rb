class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def create
    @event = Event.create!(
      description: event_params['description'],
      start_date: Date.parse(event_params['start_date']),
      end_date: Date.parse(event_params['end_date'])
    )

    respond_to do |format|
      format.html { redirect_to action: :index }
      format.js {}
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
