FactoryBot.define do
  factory :event do
    title { Faker::Lorem.sentence(1, true) }
    description { Faker::Lorem.sentence(3, true) }
    start_date { Faker::Date.forward(23) }
    end_date { Faker::Date.backward(14) }
  end
end
