require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test 'valid event' do
    event = Event.new(title: 'New Event', description: "Event's description",
                      start_date: Time.now, end_date: Time.now + 1.day)
    assert event.valid?
  end

  test 'invalid without title' do
    event = Event.new(description: "Event's description",
                      start_date: Time.now, end_date: Time.now + 1.day)
    refute event.valid?
    assert_not_nil event.errors[:title]
  end

  test 'invalid without dates' do
    event = Event.new(title: 'New Event', description: "Event's description")
    refute event.valid?
    assert_not_nil event.errors[:start_date]
    assert_not_nil event.errors[:end_date]
  end

  test 'invalid if start_date later that end_date' do
    event = Event.new(title: 'New Event', description: "Event's description",
                      start_date: Time.now + 1.day, end_date: Time.now)
    refute event.valid?
    assert_not_nil event.errors[:end_date]
  end
end
