class Event < ActiveRecord::Base
  validates :title, :starts_at, :ends_at, presence: true
  validate :date_range_correct?

  def date_range_correct?
    if starts_at.present? && ends_at.present? && starts_at > ends_at
      errors[:base] << 'The start date should be less or equal than the end date'
    end
  end
end
