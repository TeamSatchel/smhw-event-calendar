require 'rails_helper'

describe EventsHelper do
  context 'includes constants' do
    it { expect(subject::CSS_CLASS_WIDTH_PREFIX).not_to be nil }
    it { expect(subject::CSS_CLASS_OFFSET_PREFIX).not_to be nil }
    it { expect(subject::CSS_CLASS_EVENT_IN_PAST).not_to be nil }
  end

  context 'get_css_classes works correctly' do
    let(:required_css_classes) { [subject::CSS_CLASS_WIDTH_PREFIX, subject::CSS_CLASS_OFFSET_PREFIX] }
    let(:required_css_class_for_past_event) { subject::CSS_CLASS_EVENT_IN_PAST }

    let(:event) { create(:event) }
    let(:current_time) { Time.now }
    let(:event_type_week) { EventCalendar::Types::Week.new(current_time) }
    let(:decorated_event) { EventCalendar::Event::Decorator.new(event, event_type_week) }


    before(:each) do
      allow(EventCalendar::Event::Decorator).to receive(:new)
        .with(an_instance_of(Event), an_instance_of(EventCalendar::Types::Week))
        .and_return(decorated_event)
    end

    context 'and returns width and position event classes' do
      it { expect(helper.get_css_classes(event, event_type_week)).to include(*required_css_classes) }
      it { expect(helper.get_css_classes(event, event_type_week)).not_to include(required_css_class_for_past_event) }
    end

    context 'and returns color marked past in additionally' do
      let(:current_time) { Time.now - 20.days }
      let(:event) { create(:event, start_at: current_time, end_at: current_time) }

      it { expect(helper.get_css_classes(event, event_type_week)).to include(*required_css_classes) }
      it { expect(helper.get_css_classes(event, event_type_week)).to include(required_css_class_for_past_event) }
    end
  end
end