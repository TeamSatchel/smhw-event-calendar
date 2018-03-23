require 'rails_helper'

RSpec.describe Event do
  subject { build(:event) }
  let(:today) { Date.today }

  describe '.within_range' do
    it 'returns all events that fall between the two dates' do
      event1 = create(:event, start_date: today)
      event2 = create(:event, start_date: today.next_week)
      create(:event, start_date: today.next_month)

      events = Event.within_range(today, today.next_week)

      expect(events).to match_array([event1, event2])
    end
  end

  describe '#create' do
    it 'persists the end_date by using the start_date and length_days' do
      subject = create(:event, start_date: today, length_days: 8)

      expect(subject.end_date).to eq(today.next_day(7))
    end

    context 'without length_days' do
      it 'sets the length_days to 1' do
        subject = create(:event, start_date: today, description: 'no length_days')

        expect(subject.reload.length_days).to eq(1)
      end
    end
  end

  describe 'validations' do
    context 'valid' do
      it 'is valid with description and start_date only' do
        expect(subject).to be_valid
      end
    end

    context 'invalid' do
      it 'is invalid without a description' do
        subject.description = nil

        expect(subject).not_to be_valid
      end

      it 'is invalid without a start_date' do
        subject.start_date = nil

        expect(subject).not_to be_valid
      end

      it 'is invalid with 0 length_days' do
        subject.length_days = 0

        expect(subject).not_to be_valid
      end
    end
  end
end
