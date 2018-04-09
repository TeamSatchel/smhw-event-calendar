class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_not_before_start

  scope :current_week_events, -> {
    where('start_date BETWEEN ? AND ?', Date.today.at_beginning_of_week, Date.today.at_end_of_week).
        order(:start_date)
  }

  def end_not_before_start
    errors.add(:end_date, 'end date should follow after start') if self.end_date && self.start_date && self.end_date < self.start_date
  end

  def self.default_form_data
    new(title: 'test event', start_date: Date.current, end_date: Date.current)
  end
end
