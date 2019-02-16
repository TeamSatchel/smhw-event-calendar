RSpec.describe EventsService, type: :service do
  it '#events' do
    events = create_list(:event, 3)
    expect(described_class.events).to eq(events)
  end

  describe '#new_event' do
    let(:params) do
      {
        start_date: Date.parse('2019-02-17'),
        end_date: Date.parse('2019-02-18'),
        title: 'This is a title',
        description: '01A Maths',
        signature: 'Mr N Gohil'
      }
    end

    subject { described_class.new_event(params) }

    context 'valid params' do
      it 'create new event' do
        expect { subject }.to change { Event.count }.by(1)
      end

      it 'contains related values' do
        is_expected.to have_attributes(params)
      end
    end

    context 'invalid params returns model with errors' do
      it 'blank params' do
        params = {}
        event  = described_class.new_event(params)
        expect(Event.count).to eq(0)
        expect(event.errors).not_to be_empty
      end

      it 'start date cannot be before the start date' do
        new_params = params.merge(
          start_date: Date.current + 1,
          end_date: Date.current
        )
        event = described_class.new_event(new_params)
        expect(event.errors).not_to be_empty
      end
    end
  end
end
