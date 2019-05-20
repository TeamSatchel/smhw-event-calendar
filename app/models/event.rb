class Event < ActiveRecord::Base

  belongs_to :user

  validates :user_id, :start_date, :end_date, presence: true

end