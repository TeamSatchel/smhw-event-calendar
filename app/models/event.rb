# frozen_string_literal: true

class Event < ActiveRecord::Base
  MAX_TITLE_LENGTH       = 50
  MAX_DESCRIPTION_LENGTH = 200

  before_create { self.color = "##{SecureRandom.hex(3)}" }

  validates :title, :start_date, :end_date, presence: true
  validates :title,       length: { maximum: MAX_TITLE_LENGTH }
  validates :description, length: { maximum: MAX_DESCRIPTION_LENGTH }

  validate :dates_order, if: -> { start_date.present? && end_date.present? }

  def self.date_ranged(params = {})
    start_date = params[:start]&.to_date || Time.zone.today.beginning_of_week
    end_date   = params[:end]&.to_date   || Time.zone.today.end_of_week

    where('(start_date BETWEEN :start AND :end) OR
           (end_date BETWEEN :start AND :end) OR
           (start_date <= :start AND end_date >= :end)',
          start: start_date, end: end_date)
  end

  def self.serialize
    all.to_a.map(&:serialize!)
  end

  def serialize!
    hash = serializable_hash.except('id', 'created_at', 'updated_at')

    hash['start'] = hash.delete('start_date')
    hash['end']   = hash.delete('end_date')
    hash
  end

  private

  def dates_order
    errors.add(:base, I18n.t('alerts.errors.event.dates_order')) if
      end_date < start_date
  end
end
