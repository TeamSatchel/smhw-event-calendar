class EventsController < ApplicationController
  
  def index
    date = nil
    if params['date'].present?
      date = params['date']
    end
    @events = GetEvents.new(date).to_a
    
    respond_to do |format|
      format.html do 
        @decorated_events = GetDecoratedEvents.call(@events)
        @events = @decorated_events
      end
      format.json {render json: @events.to.json}
    end
  end
  
  def create 
    @form = EventForm.from_params(params)
    
    respond_to do |format|
      if @form.valid?
        CreateEvent.call(@form) do 
          on(:ok) do
            format.html {redirect_to index_path}
            format.json {render json: @form}
          end 
          on(:invalid) do
            format.html {redirect_to index_path, notice: "We could not create new event"}
            format.json {render json: {success: "false", message: "We could not create new event"}}
          end 
        end  
      else
        format.html {redirect_to index_path, notice: "We could not create new event"}
        format.json {render json: {success: "false", message: "We could not create new event"}}
      end
    end
  end
  
end
