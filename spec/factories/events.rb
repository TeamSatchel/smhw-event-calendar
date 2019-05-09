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
  factory :event do
    description { "MyText" }
    start_date { "2019-05-04" }
    end_date { "2019-05-04" }
  end
end
