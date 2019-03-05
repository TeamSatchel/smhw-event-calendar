require 'rails_helper'

describe EventCalendar::Types::Base do
  subject { EventCalendar::Types::Base.new(Time.now) }

  context 'methods exists' do
    it { expect(subject).to respond_to(:type) }
    it { expect(subject).to respond_to(:range_identifier) }
    it { expect(subject).to respond_to(:event_start_at_position_identifier) }
    it { expect(subject).to respond_to(:event_length_of_visible) }
  end

  context 'methods raise EventCalendarTypeBaseException' do
    let(:exception_class) { EventCalendar::Types::Base::EventCalendarTypeBaseException }

    it { expect{ subject.type }.to raise_error(exception_class, 'Method `type` must be implemented all successions') }
    it { expect{ subject.range_identifier }.to raise_error(exception_class, 'Method `range_identifier` must be implemented all successions') }
    it { expect{ subject.event_start_at_position_identifier }.to raise_error(exception_class, 'Method `event_start_at_position_identifier` must be implemented all successions') }
    it { expect{ subject.event_length_of_visible }.to raise_error(exception_class, 'Method `event_length_of_visible` must be implemented all successions') }
  end
end