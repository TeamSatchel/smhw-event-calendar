class EventsController < ApplicationController
  
  def index
    date = Time.zone.now.to_datetime
    if params['date'].present?
      date = Date.parse(params['date']).to_datetime
    end
    @events = GetEvents.new(date).to_a
    @decorated_events = []
    puts "--------"
    @events.each do |event|
      @decorated_events.push EventDecorator.new(event).js_event_format
      puts EventDecorator.new(event).js_event_format.to_s
    end
    puts "--------"
          
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
            format.json {render json: {success: "true", data: @form.to_json}}
            format.js {render 'event_created', format: [:js]}
          end 
          on(:invalid) do
            format.html {redirect_to index, notice: "We could not create new event"}
            format.json {render json: {success: "false", message: "We could not create new event"}}
            format.js {render 'event_created', format: [:js]}
          end 
        end  
      else
        format.html {redirect_to index, notice: "We could not create new event"}
        format.json {render json: {success: "false", message: "We could not create new event"}}
        format.js {render 'event_created', format: [:js]}
      end
    end
  end
  
end
