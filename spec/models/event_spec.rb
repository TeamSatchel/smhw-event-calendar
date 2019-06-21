require 'rails_helper'
require 'pry'

RSpec.describe Event, type: :model do
  context 'not valid event' do
    it 'calendar should be present' do
      event = build(:event, calendar_id: nil)
      expect(event.valid?).to be false
      expect(event.errors.messages.keys.include?(:calendar)).to be true
    end

    it 'start_date and title should be present' do
      event = build(:event, title: nil, start_date: nil)
      expect(event.valid?).to be false
      expect(event.errors.messages.keys.include?(:title)).to be true
      expect(event.errors.messages.keys.include?(:start_date)).to be true
    end

    it 'end_date should be greater than start_date' do
      event = build(:event, start_date: Time.now, end_date: Time.now - 30.minutes)
      expect(event.valid?).to be false
      expect(event.errors.messages.keys.include?(:end_date)).to be true
    end
  end

  context 'valid event' do
    it 'assigns end_date as a start_date + 30 minutes' do
      time = Time.now
      event = build(:event, start_date: time, end_date: nil)
      expect(event.valid?).to be true
      expect(event.end_date).to eq(event.start_date + 30.minutes)
    end
  end


end
