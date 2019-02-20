RSpec.describe Events::BaseService, type: :service do
  let(:start_date) { Date.current }
  let(:end_date)   { Date.current + 1 }

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

    subject { described_class.new_event(params).event }

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

      it '#update_event' do
        title = 'some best Event'
        event = create(:event, title: 'some cool Event')
        params = ActionController::Parameters.new(id: event.id, title: title)
        described_class.update_event(params)
        expect(Event.first.title).to eq(title)
      end
    end

    context 'invalid params returns model with errors' do
      it 'blank params' do
        params = {}
        event_service = described_class.new_event(params)
        expect(Event.count).to eq(0)
        expect(event_service.errors?).to be_truthy
      end

      it 'start date cannot be before the start date' do
        new_params = params.merge(
          start_date: Date.current + 1,
          end_date: Date.current
        )
        event_service = described_class.new_event(new_params)
        expect(event_service.error_messages).not_to be_empty
      end
    end
  end
end
