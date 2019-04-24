class Event < ApplicationRecord
  validates :title, presence: true
  attr_accessor :date_range
  validates :date_range, presence: true
  attr_accessor :start_time
  attr_accessor :end_time
end
