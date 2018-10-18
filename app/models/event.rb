class Event < ActiveRecord::Base
  validates :title, :starts_at, :ends_at, presence: true
end
