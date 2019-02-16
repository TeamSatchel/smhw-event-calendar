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

    context 'invalid params' do
      let(:params) { {} }

      it 'returns model with errors' do
        subject
        expect(Event.count).to eq(0)
        expect(subject.errors).not_to be_empty
      end
    end
  end
end
