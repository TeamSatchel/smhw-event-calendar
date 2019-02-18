RSpec.describe EventsService, type: :service do
  let(:start_date) { Date.current }
  let(:end_date)   { Date.current + 1 }

  it '#events' do
    events = create_list(:event, 3, start_date: start_date)
    expect(described_class.events).to eq(events)
  end

  describe '#new_event' do
    let(:params) do
      {
        start_date: start_date,
        end_date: end_date,
        title: 'This is a title',
        description: '01A Maths',
        signature: 'Mr N Gohil'
      }
    end

    subject { described_class.new_event(params) }

    it 'date format' do
      expect(subject.start_date).to eq(Date.iso8601(start_date.to_s))
      expect(subject.end_date).to   eq(Date.iso8601(end_date.to_s))
    end

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
