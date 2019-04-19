class EventsController < ApplicationController
  private
  def collection
    @collection ||= Event.all
  end
end
