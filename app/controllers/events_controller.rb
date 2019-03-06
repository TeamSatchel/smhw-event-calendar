class EventsController < ApplicationController
  
  def index
    @events = GetEvents.get_events
    respond_to do |format|
      format.html
      format.json {render json: @events.to.json}
    end
  end
  
  def create 
    @form = EventForm.from_params(params)
    
    CreateEvent.call(@form) do 
      respond_to do |format|
        on(:ok) do
          format.html {redirect_to index_path}
          format.json {render json: @form}
        end 
        on(:invalid) do
          format.html {redirect_to index_path, notice: "We could not create new event"}
          format.json {render json: {success: "false", message: "We could not create new event"}}
        end 
      end
    end
  end
end
