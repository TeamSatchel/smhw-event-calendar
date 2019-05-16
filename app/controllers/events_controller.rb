class EventsController < ApplicationController

  def index
  end

  # POST /events
  def create
    event = Event.new

    respond_to do |format|
      format.js
    end
  end
end
