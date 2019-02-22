class Event < ApplicationRecord
  validates :title, :description, presence: true
  validates :start_date, date: { before_or_equal_to: :end_date }, presence: true
  validates :end_date, date: true, presence: true

  scope :between_dates, ->(date1, date2) { where('start_date BETWEEN :date1 AND :date2 OR start_date BETWEEN :date1 AND :date2', date1: date1.to_date, date2: date2.to_date) }
end
