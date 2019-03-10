class Event < ActiveRecord::Base
  ## Constants
  ATTRIBUTE_LIMIT = {
      title: 25,
      description: 150
  }

  VALIDATION_MESSAGES = {
      start_date: 'should be before or eql the end date'
  }

  ## Validations
  validates :title, length: { maximum: ATTRIBUTE_LIMIT[:title] }
  validates :description, length: { maximum: ATTRIBUTE_LIMIT[:description] }
  validates_presence_of :start_date, :end_date, :title
  validate :start_date_is_before_or_eql

  ## Methods

  private

  def start_date_is_before_or_eql
    return if (!start_date.blank? && !end_date.blank?) && (start_date <= end_date)
    errors.add(:start_date, VALIDATION_MESSAGES[:start_date])
  end
end
