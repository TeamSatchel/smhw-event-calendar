class Event < ApplicationRecord
  validates :title, presence: true

  delegate :as_json, to: :decorate
end
