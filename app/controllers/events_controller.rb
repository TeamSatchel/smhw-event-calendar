class EventsController < ApplicationController
  def index
    render json: Event.ordered
  end
end
