class EventsController < ApplicationController
  respond_to :html, :json
  def index
    @events = Event.where(start_at: params[:start]..params[:end])
    respond_with(@events)
  end

  def new
  end

end
