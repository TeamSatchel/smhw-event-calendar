class Event < ActiveRecord::Base
  validates :description, :start_date, :end_date, presence: true
  validate :valid_date_order

  def valid_date_order
    return unless start_date && end_date
    errors.add(:end_date, 'must be equal to or after Start date') if start_date > end_date
  end
end
