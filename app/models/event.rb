class Event < ApplicationRecord
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :dates_succession

  scope :ordered, -> { order start_date: :asc }

  private

  def dates_succession
    return unless start_date && end_date

    if end_date < start_date
      errors.add(:end_date, 'cannot precede the start_date')
    end
  end
end
