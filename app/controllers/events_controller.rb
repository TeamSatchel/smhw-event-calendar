class EventsController < ApplicationController
  
  def index
    date = Time.zone.now.to_datetime
    if params['date'].present?
      date = Date.parse(params['date']).to_datetime
    end
    @events = GetEvents.new(date).to_a
    @decorated_events = []
    @events.each do |event|
      @decorated_events.push EventDecorator.new(event).js_event_format
      puts "--------"
      puts EventDecorator.new(event).js_event_format.to_s
      puts "--------"
    end
          
    respond_to do |format|
      format.html
      format.json { render json: @decorated_events.to_json }
    end
  end
  
  def create 
    @form = EventForm.from_params(params)
    
    respond_to do |format|
      if @form.valid?
        CreateEvent.call(@form) do 
          on(:ok) do
            format.html {redirect_to index}
            format.js {render json: @form}
          end 
          on(:invalid) do
            format.html {redirect_to index, notice: "We could not create new event"}
            format.js {render json: {success: "false", message: "We could not create new event"}}
          end 
        end  
      else
        format.html {redirect_to index, notice: "We could not create new event"}
        format.js {render json: {success: "false", message: "We could not create new event"}}
      end
    end
  end
  
end
