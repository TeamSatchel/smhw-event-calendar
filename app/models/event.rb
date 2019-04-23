class Event < ApplicationRecord
  validates :title, :start_date, :end_date, presence: true

  delegate :as_json, to: :decorate
end
