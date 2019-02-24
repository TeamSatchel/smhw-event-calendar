class Event < ActiveRecord::Base
  validates :title, :start_date, :end_date, presence: true
  scope :current_week, -> { where('start_date>=? AND start_date<=?', Date.today.at_beginning_of_week, Date.today.at_end_of_week).or(where('end_date>=? AND end_date<=?', Date.today.at_beginning_of_week, Date.today.at_end_of_week)).order(start_date: :asc) }

  def generate_schedule_data(schedule, monday = Date.today.at_beginning_of_week, sunday = Date.today.at_end_of_week)
    item = {}
    item[:from_last_week] = monday > start_date ? true : false
    item[:to_next_week]   = sunday < end_date   ? true : false
    item[:position]       = define_position(schedule)
    if item[:from_last_week] && item[:to_next_week]
      item[:duration] = 7
    elsif item[:from_last_week]
      item[:duration] = end_date.cwday
    elsif item[:to_next_week]
      item[:duration] = 8 - start_date.cwday
    else
      item[:duration] = end_date.cwday - start_date.cwday  + 1
    end
    item[:start_date]  = start_date
    item[:end_date]    = end_date
    item[:title]       = title
    item[:description] = description
    item[:signature]   = signature
    item
  end

  def define_position(schedule)
    positions = []
    schedule.each do |k, schedule_day|
      schedule_day.each do |schedule_event|
        if schedule_event.present? && schedule_event[:end_date] >= start_date && schedule_event[:start_date] <= end_date
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