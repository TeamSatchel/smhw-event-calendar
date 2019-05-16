class Event < ApplicationRecord
  validates :start_date, presence: true

  def as_json(*)
    { id: id, start: start_date, end: end_date, title: description }
  end
end
