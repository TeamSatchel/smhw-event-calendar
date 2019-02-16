FactoryBot.define do
  factory :event, class: Event do
    start_date  { Date.current - 1 }
    end_date    { Date.current + 1 }
    description { Faker::Lorem.sentence }
  end
end
