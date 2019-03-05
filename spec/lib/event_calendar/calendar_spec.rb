require 'rails_helper'

describe EventCalendar::Calendar do
  let(:event) { create(:event) }
  let(:current_time) { Time.now }
  let(:event_type_week) { EventCalendar::Types::Week.new(current_time) }

  subject { EventCalendar::Calendar.new(event_type_week, event) }

  context 'methods exists' do
    it { expect(subject).to respond_to(:to_partial_path) }
    it { expect(subject).to respond_to(:calendar_type) }
    it { expect(subject).to respond_to(:events) }
  end

  context 'to_partial_path works correct' do
    it { expect(subject.to_partial_path).to match(/#{event_type_week.type}/) }
  end
end