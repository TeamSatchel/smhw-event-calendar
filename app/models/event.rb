class Event < ApplicationRecord
  DATE_FORMAT     = '%Y-%m-%d'
  DATETIME_FORMAT = '%Y-%m-%dT%H:%M:%S'

  validates :description, :start_at, :end_at, presence: true
  attr_accessor :date_range

  def all_day_event?
    start_at == start_at.midnight && end_at == end_at.midnight
  end
end
