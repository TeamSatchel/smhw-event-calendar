class Event < ActiveRecord::Base
  validates :description, :start_time, :end_time, presence: true
  validates :description, length: { maximum: 500 }
  validate  :end_time_is_bigger

  private

  def end_time_is_bigger
    return if (end_time && start_time) && (end_time > start_time)
    errors.add(:end_time, 'must be after the start time')
  end
end
