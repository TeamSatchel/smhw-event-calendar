FactoryBot.define do
  factory :event do
    sequence :title do |n|
      "Event ##{n}"
    end

    location 'Hollywood Boulevard 5550'
    description 'Meeting Benicio del Toro'

    start_date 3.days.ago
    end_date 2.days.from_now
  end
end
