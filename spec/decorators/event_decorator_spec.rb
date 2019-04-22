require 'rails_helper'

RSpec.describe EventDecorator do
  let(:start_date) { Time.zone.parse '2019-04-19 19:00' }

  let(:end_date) { Time.zone.parse '2019-04-19 20:00' }

  let :event do
    stub_model Event,
      id: 1,
      title: 'Presidential debates in Ukraine',
      start_date: start_date,
      end_date: end_date
  end

  subject { event.decorate }

  its :as_json do
    should eq \
      id: 1,
      title: 'Presidential debates in Ukraine',
      start: start_date,
      end: end_date
  end
end
