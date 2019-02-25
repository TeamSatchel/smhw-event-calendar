require 'rails_helper'

RSpec.describe Event, type: :model do

  let(:event) {
    FactoryBot.create(:event)
  }

  let(:event_from_last_week) {
    FactoryBot.create(:event, start_date: (Date.today - 10))
  }

  let(:event_to_next_week) {
    FactoryBot.create(:event, end_date: (Date.today + 10))
  }

  let(:event_from_last_week_to_next_week) {
    FactoryBot.create(:event, start_date: (Date.today - 10), end_date: (Date.today + 10))
  }

  it "generate schedule data should return event date" do
    data = event.generate_schedule_data({})
    expect(data[:position]).to eq(1)
    expect(data[:duration]).to eq(2)
    expect(data[:to_next_week]).to eq(false)
    expect(data[:from_last_week]).to eq(false)
  end

  it "generate schedule data should return event from last week" do
    data = event_from_last_week.generate_schedule_data({})
    expect(data[:position]).to eq(1)
    expect(data[:to_next_week]).to eq(false)
    expect(data[:from_last_week]).to eq(true)
  end

  it "generate schedule data should return event to next week" do
    data = event_to_next_week.generate_schedule_data({})
    expect(data[:position]).to eq(1)
    expect(data[:to_next_week]).to eq(true)
    expect(data[:from_last_week]).to eq(false)
  end

  it "generate schedule data should return event from last week to next week" do
    data = event_from_last_week_to_next_week.generate_schedule_data({})
    expect(data[:position]).to eq(1)
    expect(data[:duration]).to eq(7)
    expect(data[:to_next_week]).to eq(true)
    expect(data[:from_last_week]).to eq(true)
  end
end
