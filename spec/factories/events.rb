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

FactoryBot.define do
  factory :event, aliases: [:one_day_event] do
    description { "Awesome" }
    start_date { "2019-05-31" }

    factory :long_event do
      end_date { Date.parse(start_date) + 3.days }
    end
  end
end
