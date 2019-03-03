class Event < ActiveRecord::Base
  validates :title, :start_at, :end_at, presence: true
end
