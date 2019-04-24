class Event < ApplicationRecord
  validates :title, presence: true
  attr_accessor :date_range
  validates :date_range, presence: true
  attr_accessor :start_time
  attr_accessor :end_time
  
  def all_day_event?
    self.start_date == self.start_date.midnight && self.end_date == self.end_date.midnight ? true : false
  end
end
