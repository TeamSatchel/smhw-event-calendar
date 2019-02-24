class EventsController < ApplicationController
  def index
    today   = Date.today
    @monday = today.at_beginning_of_week
    @sunday = today.at_end_of_week
  	generate_schedule
  end

  def create
  end

  private 

  def permit_params
    params.require(:event).permit(:start_date, :end_date, :title, :description, :signature)
  end

  def generate_schedule
    @schedule = {}
    (0..7).map { |i| @schedule[i] = [] }
    events    = Event.current_week
    events.each do |event|
      item = {}
      week_day_start        = @monday > event.start_date ? 0    : (event.start_date.cwday - 1)
      item[:from_last_week] = @monday > event.start_date ? true : false
      item[:to_next_week]   = @sunday < event.end_date   ? true : false
      item[:position]       = define_position(event)
      if item[:from_last_week] && item[:to_next_week]
        item[:duration] = 7
      elsif item[:from_last_week]
        item[:duration] = event.end_date.cwday
      elsif item[:to_next_week]
        item[:duration] = 8 - event.start_date.cwday
      else
        item[:duration] = event.end_date.cwday - event.start_date.cwday  + 1
      end
      item[:start_date]  = event.start_date
      item[:end_date]    = event.end_date
      item[:title]       = event.title
      item[:description] = event.description
      item[:signature]   = event.signature
      @schedule[week_day_start] << item
    end
  end

  def define_position(event)
    positions = []
    @schedule.each do |k, schedule_day|
      schedule_day.each do |schedule_event|
        if schedule_event.present? && schedule_event[:end_date] >= event.start_date && schedule_event[:start_date] <= event.end_date
          positions << schedule_event[:position]
        end
      end
    end
    position = 1
    while positions.include?(position) && position < 1000 do
      position += 1
    end
    position
  end

end
