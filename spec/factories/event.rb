# frozen_string_literal: true

FactoryBot.define do
  factory :event, class: Event do
    title { Faker::Lorem.words }
    description { Faker::Lorem.paragraph }
    signature { Faker::Lorem.words }
    start_date { Date.today }
    end_date { Date.tomorrow }
  end
end