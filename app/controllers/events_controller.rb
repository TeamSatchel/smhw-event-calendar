class EventsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json do
        @events = Event.between_dates(params[:start], params[:end])
      end
    end
  end
end
