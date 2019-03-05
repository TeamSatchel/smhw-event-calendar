require 'rails_helper'

describe EventCalendar::Types::Week do
  subject { EventCalendar::Types::Week.new(Time.parse('2019-01-01')) }
  let(:event) { create(:event) }

  context 'all required methods are implemented' do
    it { expect{ subject.type }.not_to raise_error}
    it { expect{ subject.range_identifier }.not_to raise_error}
    it { expect{ subject.event_start_at_position_identifier(event) }.not_to raise_error}
    it { expect{ subject.event_length_of_visible(event) }.not_to raise_error}
  end

  context 'range_identifier works correct' do
    it { expect( subject.range_identifier ).to eq(1) }
  end

  context 'event_start_at_position_identifier works correct' do
    it { expect( subject.event_start_at_position_identifier(event) ).to eq(event.start_at.to_date.cwday) }

    context 'reset identifier' do
      let(:event) { create(:event, start_at: Time.parse('2018-12-31')) }
      it { expect( subject.event_start_at_position_identifier(event) ).to eq(0) }
    end
  end

  context 'event_length_of_visible works correct' do
    let(:event) { create(:event, start_at: Time.now, end_at: Time.now + 1.day) }
    let(:week) { EventCalendar::Types::Week.new(Time.now) }

    it { expect( week.event_length_of_visible(event) ).to eq(2) }

    context 'overflow of length' do
      let(:event) { create(:event, start_at: Time.now, end_at: Time.now + 2.weeks) }
      let(:event_days_count) { (Time.now.to_date..(Time.now + 2.weeks).to_date).count }
      let(:days_diff) { (Time.now.end_of_week.to_date..(Time.now + 2.weeks).to_date).count - 1 }

      it { expect( week.event_length_of_visible(event) ).to eq(event_days_count - days_diff) }
    end

    context 'overflow of start' do
      let(:event) { create(:event, start_at: Time.now - 2.weeks, end_at: Time.now) }
      let(:event_days_count) { ((Time.now - 2.weeks).to_date..Time.now.to_date).count }
      let(:days_diff) { ((Time.now - 2.weeks).to_date..Time.now.beginning_of_week.to_date).count - 1 }

      it { expect( week.event_length_of_visible(event) ).to eq(event_days_count - days_diff) }
    end
  end
end