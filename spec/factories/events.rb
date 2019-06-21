FactoryBot.define do
  factory :event do
    title { "MyString" }
    description { "MyText" }
    start_date { "2019-06-19" }
    end_date { "2019-06-19" }
    calendar
  end
end
