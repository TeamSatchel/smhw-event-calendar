class Event < ApplicationRecord
  validates :start_date, :end_date, :description, presence: true
  validate :end_date_is_after_start_date

  scope :on_current_week, lambda {
    week_start_at = Date.current.beginning_of_week
    week_end_at   = Date.current.end_of_week
    where('start_date >= ? AND start_date <= ?', week_start_at, week_end_at)
  }

  private

  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?

    errors.add(:end_date, 'cannot be before the start date') if end_date < start_date
  end
end
