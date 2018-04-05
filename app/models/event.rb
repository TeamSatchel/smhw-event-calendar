class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_not_before_start

  def end_not_before_start
    errors.add(:end_date, 'end date should follow after start') if self.end_date && self.start_date && self.end_date < self.start_date
  end
end
