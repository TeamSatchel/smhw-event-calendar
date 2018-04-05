require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @event = events(:valid)
  end

  test 'valid event' do
    assert @event.valid?
  end

  test 'invalid without title' do
    @event.title = nil
    refute @event.valid?, 'saved event without a title'
    assert_not_nil @event.errors[:title], 'no validation error for name present'
  end

  test 'invalid without start at' do
    @event.start_date = nil
    refute @event.valid?, 'saved event without start at'
    assert_not_nil @event.errors[:start_date]
  end

  test 'start at should be valid date' do
    @event.start_date = '234/23/4234/23423'
    refute @event.valid?, 'saved event with invalid start at'
    assert_not_nil @event.errors[:start_date]
  end

  test 'invalid without end at' do
    @event.end_date = nil
    refute @event.valid?, 'saved event without finish at'
    assert_not_nil @event.errors[:end_date]
  end

  test 'finish at should be valid date' do
    @event.end_date = '234/23/4234/23423'
    refute @event.valid?, 'saved event with invalid finish at'
    assert_not_nil @event.errors[:end_date]
  end

  test 'start date before end date' do
    @event.end_date = @event.start_date - 1.day
    refute @event.valid?, 'end date should not be before start'
    assert_not_nil @event.errors[:end_date]
  end
end
