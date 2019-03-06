FactoryBot.define do
  factory :event do
    id {1}
    event_start {Time.zone.now.to_datetime}
    event_end {Time.zone.now.to_datetime + 30.minutes}
    description {"Lorem Ipsum"}
  end
end
