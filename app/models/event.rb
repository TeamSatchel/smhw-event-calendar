class Event < ApplicationRecord
  validates_presence_of :title
  attr_accessor :date_range
end
