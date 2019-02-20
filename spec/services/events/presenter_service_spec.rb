RSpec.describe Events::PresenterService, type: :service do
  let(:start_date) { Date.current }
  let(:end_date)   { Date.current + 1 }

  it '#events' do
    events = create_list(:event, 3, start_date: start_date)
    expect(described_class.events).to eq(events)
  end
end
