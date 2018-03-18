class EventsController < ApplicationController
  def index
    @week = DateTime.current.beginning_of_week..DateTime.current.end_of_week
    @events = Event.actual
  end
end
