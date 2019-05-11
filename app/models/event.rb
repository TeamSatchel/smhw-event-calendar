# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  description :text             not null
#  start_date  :date
#  end_date    :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ApplicationRecord
  validates :description, presence: true

  validates :start_date, presence: true
  validates :start_date, timeliness: { type: :date }

  validates :end_date, timeliness: {
    type: :date,
    allow_nil: true,
    on_or_after: :start_date
  }
end
