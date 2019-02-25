class Event < ActiveRecord::Base
  attr_accessor :date_range

  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

end
