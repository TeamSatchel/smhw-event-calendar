class Event < ApplicationRecord
  DATE_FORMAT     = '%Y-%m-%d'
  DATETIME_FORMAT = '%Y-%m-%dT%H:%M:%S'

  def all_day_event?
    start_at == start_at.midnight && end_at == end_at.midnight
  end
end
