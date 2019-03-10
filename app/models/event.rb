class Event < ActiveRecord::Base
  # ==========================================================
  # Validations
  # ==========================================================
  validates :title, :start_date, :end_date, presence: true
  validate :dates_validation

  private

  def dates_validation
    return unless start_date && end_date
    errors.add(:end_date, "can't be earlier that start_date") if end_date < start_date
  end
end
