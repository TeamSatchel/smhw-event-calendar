class Event < ApplicationRecord
  validates :description, presence: true
  validates :start_date, presence: true
  validates :length_days, presence: true, numericality: { greater_than: 0 }

  before_save :update_end_date

  scope :within_range, ->(start_date, end_date) { where(start_date: start_date..end_date).or(where(end_date: start_date..end_date)) }

  private

  # persist this so it can be used in within_range enabling queries to be done with sql
  def update_end_date
    self.end_date = start_date.next_day(length_days - 1)
  end
end
