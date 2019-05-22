class Event < ApplicationRecord
  # composed_of :start_date, class_name: 'RequiredDate', mapping: %w[start_date date]
  validates :start_date, presence: true

  def as_json(*)
    { id: id, start: start_date, end: end_date, title: description }
  end
end
