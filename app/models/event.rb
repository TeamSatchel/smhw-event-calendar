class Event < ActiveRecord::Base

  belongs_to :user

  validates :user_id, :title, :start_date, :end_date, presence: true

  def as_json_for_calendar
    {
      title: title,
      start: start_date,
      end: end_date
    }
  end

end