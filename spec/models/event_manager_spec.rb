require 'rails_helper'

describe EventManager do
  let(:verification_title) { Faker::Lorem.sentence(20) }
  let(:event) { create(:event, title: verification_title, start_at: Time.now, end_at: Time.now + 1.day) }
  let(:current_time) { Time.now }
  let(:event_type_week) { EventCalendar::Types::Week.new(current_time) }

  subject { EventManager.new(event.class, event_type_week) }

  context 'get_all_calendar_events is exist' do
    it { expect(subject).to respond_to(:get_all_calendar_events) }
  end

  context 'get_all_calendar_events works correct' do
    let(:db_event) { subject.get_all_calendar_events.to_a.first }

    context 'result includes event' do
      it { expect(db_event).to be_a_kind_of(event.class) }
      it { expect(db_event.title).to eq(verification_title) }
    end

    context 'result is not includes event' do
      let(:event) { create(:event, title: verification_title, end_at: Time.now - 2.weeks) }

      it { expect(db_event).to be_nil }
    end
  end
end