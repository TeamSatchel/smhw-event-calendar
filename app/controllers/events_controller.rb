class EventsController < ApplicationController

  def index
  end


  # Action renders an events sheet with empty layout via Ajax request
  def sheet
    render :layout => 'ajax'
  end

  def removeall
    Event.delete_all
  end

end
