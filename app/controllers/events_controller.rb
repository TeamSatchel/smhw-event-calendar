class EventsController < ApplicationController
  def index
    @events = Event.actual
  end
end
