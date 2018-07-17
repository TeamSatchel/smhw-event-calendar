describe Event do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :start_date }
  it { is_expected.to validate_presence_of :end_date }

  it 'validates dates succession' do
    start_date = Date.today
    end_date = Date.yesterday

    event = Event.new title: 'Event', start_date: start_date, end_date: end_date

    expect(event).not_to be_valid
    expect(event.errors[:end_date].first).to include 'cannot precede'
  end
end
