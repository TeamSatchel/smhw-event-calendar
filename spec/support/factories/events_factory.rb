FactoryBot.define do
  factory :event do
    title { Faker::Lorem.sentence(2) }
    start_at { Faker::Time.forward(2, :afternoon) }
    end_at { Faker::Time.forward(3, :afternoon) }

    trait :description do
      description { Faker::Lorem.sentence(4) }
    end
  end
end
