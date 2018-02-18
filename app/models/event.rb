class Event < ActiveRecord::Base
  validates :description, :start_date, presence: true
end
