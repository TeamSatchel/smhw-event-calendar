class EventsController < ApplicationController

  def index
    @event = Event.new(start_date: Time.current, end_date: Time.current.advance(hours: 3))
  end

  def new

  end

end
