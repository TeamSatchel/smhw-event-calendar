class EventsController < ApplicationController
  def index
    today     = Date.today
    @monday   = today.at_beginning_of_week
    @sunday   = today.at_end_of_week
  	generate_schedule
  end

  def create
    generate_schedule
    event    = Event.new(event_params)
    respond_to do |format|
      format.html
      if event.save
        data = event.generate_schedule_data(@schedule)
        week_day_start = Date.today.at_beginning_of_week > event.start_date ? 0 : (event.start_date.cwday - 1)
        format.js { render 'create_event.js.erb', :locals => { :data => data.to_json, :week_day_start => week_day_start.to_json }}
      else
        format.js { render 'create_event.js.erb', :locals => { :error => event.errors.full_message }}
      end
    end
  end

  private 

  def event_params
    params.require(:event).permit(:start_date, :end_date, :title, :description, :signature)
  end

  def generate_schedule
    @schedule = {}
    (0..7).map { |i| @schedule[i] = [] }
    events = Event.current_week
    events.each do |event|
      week_day_start = Date.today.at_beginning_of_week > event.start_date ? 0 : (event.start_date.cwday - 1)
      item = event.generate_schedule_data(@schedule)
      @schedule[week_day_start] << item
    end
  end

end
