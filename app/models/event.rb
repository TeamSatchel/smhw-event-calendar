class Event < ActiveRecord::Base
  validates :title, :start_date, :end_date, presence: true
  scope :current_week, -> { where('start_date>=? AND start_date<=?', Date.today.at_beginning_of_week, Date.today.at_end_of_week).or(where('end_date>=? AND end_date<=?', Date.today.at_beginning_of_week, Date.today.at_end_of_week)).order(start_date: :asc) }
end