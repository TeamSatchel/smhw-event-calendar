class Event < ActiveRecord::Base

  belongs_to :user

  validates :user_id, :start_date, :end_date, presence: true

  def as_json_for_calendar
    {
      title: 'Example',
      start: start_date,
      end: end_date
    }
  end

end