# frozen_string_literal: true

class Event < ApplicationRecord

  validate :dates_ordered_correctly?

  def dates_ordered_correctly?
    if end_date < start_date
      errors[:base] << "Dates are invalid"
    end
  end
end
