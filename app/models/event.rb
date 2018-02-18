class Event < ActiveRecord::Base
  validates :description, :start_date, :end_date, presence: true
end
