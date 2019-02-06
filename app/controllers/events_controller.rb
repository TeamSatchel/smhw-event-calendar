class EventsController < ApplicationController
  def index
    @days_of_week = (Date.current.beginning_of_week..Date.current.end_of_week).to_a
  end
end
