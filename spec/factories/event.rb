FactoryBot.define do
  factory :event do
    title Faker::Lorem.words(2)
    description Faker::Lorem.words(3)
    start_at Time.now - 1.day
    end_at Time.now + 1.day
  end
end
