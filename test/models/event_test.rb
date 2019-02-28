require 'test_helper'

class EventTest < ActiveSupport::TestCase

  test "it creates some valid Event" do
    event = Event.new(:start_date => EventCalendar::WEEK_START_DATE, :end_date => (EventCalendar::WEEK_START_DATE+1), :description => 'Some event')
    event.save
    assert_empty event.errors
  end

  test "it doesn't create an Event with a start date before current week" do
    event = Event.new(:start_date => (Date.today-14), :end_date => Date.today, :description => 'Some event')
    assert event.invalid?
  end

  test "it doesn't create an Event with a start date greater than end date" do
    event = Event.new(:start_date => EventCalendar::WEEK_END_DATE, :end_date => (EventCalendar::WEEK_END_DATE-1), :description => 'Some event')
    assert event.invalid?
  end

  test "it doesn't create second Event if events overlap" do
    event1 = Event.new(:start_date => Date.today, :end_date => Date.today, :description => 'Some event #1')
    event1.save
    event2 = Event.new(:start_date => Date.today, :end_date => Date.today, :description => 'Some event #2')
    event2.save
    assert_not_empty event2.errors
  end


end
