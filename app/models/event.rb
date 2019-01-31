class Event < ApplicationRecord
  validates :title, :description, :start_at, :end_at, presence: true
  validate :date_range_validness

  def date_range_validness
    return unless start_at
    return unless end_at
    errors[:base] << I18n.t('errors.date_range_validness_error') if start_at > end_at
  end
end
