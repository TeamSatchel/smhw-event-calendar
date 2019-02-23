class Event < ApplicationRecord
  validates :title, :description, presence: true
  validates :start_date, date: { before_or_equal_to: :end_date }, presence: true
  validates :end_date, date: true, presence: true

  scope :between_dates, ->(date1, date2) { where('start_date <= :date2 AND end_date >= :date1', date1: date1.to_date, date2: date2.to_date) }

  def as_json(_options = {})
    {
      title: title,
      subject: subject,
      description: description,
      start: start_date.beginning_of_day,
      end: end_date.end_of_day,
    }
  end
end
