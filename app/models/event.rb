class Event < ActiveRecord::Base
  validates :title, :desctiption, :start_time, :end_time, :teacher_name, presence: true
end
