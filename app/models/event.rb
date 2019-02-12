class Event < ActiveRecord::Base
  validates :title, :start_at, :end_at, presence: true

  validate :date_range_correct?

  scope :current_week, -> {
    where('start_at >= :beginning_of_week AND start_at <= :end_of_week',
          beginning_of_week: Date.today.at_beginning_of_week,
          end_of_week: Date.today.end_of_week)
  }

  def colorize
    "#" + Digest::MD5.hexdigest(id.to_s)[0..5]
  end

  def serialize
    {
        start_at: start_at,
        duration: duration,
        colorize: colorize,
        title: title,
        days_before_week_start: days_before_week_start,
        days_to_week_end: days_to_week_end
    }
  end

  def days_before_week_start
    today = Date.today
    (start_at - today.at_beginning_of_week).to_i
  end

  def days_to_week_end
    today = Date.today
    (today.at_end_of_week - end_at).to_i
  end

  def duration
    (end_at - start_at).to_i + 1
  end

  private

  def date_range_correct?
    if start_at && end_at && start_at > end_at
      errors.add(:end_date, 'Start date have to be less than end date')
    end
  end

end
