RSpec.describe EventsController, type: :controller do
  describe '#index' do
    before { get :index }

    it 'response with status: OK' do
      expect(response.status).to eq(200)
    end
  end

  describe '#create' do
    before { post :create, params: params }

    context 'valid params' do
      let(:params) do
        { start_date: Date.current, end_date: Date.current + 1, description: 'New event' }
      end

      it 'response with status: Created' do
        expect(response.status).to eq(201)
      end

      it 'create new event' do
        expect(Event.count).to eq(1)
      end
    end

    context 'invalid params' do
      let(:params) { {} }

      it 'response with status: Bad request' do
        expect(response.status).to eq(400)
      end

      it 'not create event' do
        expect(Event.count).to eq(0)
      end
    end
  end

  describe '#update' do
    it 'update some event' do
      title = 'some best Event'
      event = create(:event, title: 'some cool Event')
      put :update, params: { id: event, title: title }
      expect(Event.first.title).to eq(title)
    end
  end
end
