class EventsController < ApplicationController

  def index
  end

  def create
    params.permit!
    @event = Event.new
    if request.post?
      @event.update_attributes params[:event]
      if @event.save
      end
    end
    render :layout => 'ajax'
  end

  # Action renders an events sheet with empty layout via Ajax request
  def sheet
    render :layout => 'ajax'
  end

  def removeall
    Event.delete_all
  end

end
