class Event < ActiveRecord::Base
  validates :title, :description, :start_date, :end_date, presence: true
  validate :end_date_cannot_be_less_than_to_start_date, if: :date_present?

  def end_date_cannot_be_less_than_to_start_date
    if end_date.to_date < start_date.to_date
      errors.add(:end_date, " should be greater than start date.")
    end
  end

  def date_present?
    start_date.present? && end_date.present?
  end
end
