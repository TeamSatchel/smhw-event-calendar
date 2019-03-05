require 'rails_helper'

describe EventCalendar::Event::Decorator do
  let(:event) { create(:event) }
  let(:current_time) { Time.now }
  let(:event_type_week) { EventCalendar::Types::Week.new(current_time) }

  subject { EventCalendar::Event::Decorator.new(event, event_type_week) }

  context 'inherited SimpleDelegator' do
    it { expect(subject).to be_a_kind_of(SimpleDelegator) }
  end

  context 'and includes correct methods' do
    it { expect(subject).to respond_to(:event_start_at_position_identifier) }
    it { expect(subject).to respond_to(:event_length_of_visible) }
    it { expect(subject).to respond_to(:event_in_past?) }
  end

  context 'methods works correctly' do
    before(:each) do
      allow_any_instance_of(EventCalendar::Types::Week).to receive(:event_start_at_position_identifier).and_return(1)
      allow_any_instance_of(EventCalendar::Types::Week).to receive(:event_length_of_visible).and_return(2)
    end

    it { expect(subject.event_start_at_position_identifier).to eq(1) }
    it { expect(subject.event_length_of_visible).to eq(2) }
    it { expect(subject.event_in_past?).to eq(false) }

    context 'past definition is correct' do
      let(:event) { create(:event, end_at: Time.now - 1.day) }
      it { expect(subject.event_in_past?).to eq(true) }
    end
  end
end