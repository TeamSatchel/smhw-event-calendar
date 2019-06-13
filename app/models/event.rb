class Event < ActiveRecord::Base
  validate :end_date_cannot_be_less_than_to_start_date

  def end_date_cannot_be_less_than_to_start_date
    if end_date.to_date < start_date.to_date
      errors.add(:end_date, " should be greater than start date.")
    end
  end
end
