class Event < ApplicationRecord
  validates :title, :description, :start_at, :end_at, presence: true
  validate :date_range_validity

  def date_range_validity
    return unless dates_complete?

    errors[:date_range_validity] << I18n.t('errors.date_range_validity_error') if start_at > end_at
  end

  private

  def dates_complete?
    !!start_at && !!end_at
  end
end
