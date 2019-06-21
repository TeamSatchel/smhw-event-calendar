class Event < ActiveRecord::Base
  belongs_to :calendar

  validates :title, :start_date, presence: true
  validate :end_greater_than_start, if: :dates_are_present?

  def end_date
    self['end_date'] || end_further_start
  end

  private
  def end_further_start
    return start_date + 30.minutes if start_date
  end

  def end_greater_than_start
    if end_date < start_date
      errors.add(:end_date, " should be greater than start date.")
    end
  end

  def dates_are_present?
    start_date.present? && end_date.present?
  end
end
