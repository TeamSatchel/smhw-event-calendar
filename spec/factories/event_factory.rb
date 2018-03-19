FactoryBot.define do
	factory :event do
	  description  'Hello world'

    trait :ended do
      start_date  Date.today - 1.month
      end_date  Date.today - 24.days
    end

    trait :in_future do
      start_date Date.today + 14.days
      end_date Date.today + 21.days
    end

    trait :two_weeks do
      start_date  DateTime.current.beginning_of_week - 3.days
      end_date  DateTime.current.end_of_week + 3.days
    end

    trait :start_and_end_on_this_week do
      start_date DateTime.current.end_of_week - 3.days
      end_date DateTime.current.end_of_week - 1.days
    end

    trait :start_on_this_end_on_next_week do
      start_date DateTime.current.beginning_of_week + 1.days
      end_date DateTime.current.end_of_week + 2.days
    end

    trait :start_on_previous_week_end_on_this do
      start_date DateTime.current.beginning_of_week - 2.days
      end_date DateTime.current.end_of_week - 2.days
    end
  end
end
