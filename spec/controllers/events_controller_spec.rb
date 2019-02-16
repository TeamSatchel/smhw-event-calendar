RSpec.describe EventsController, type: :controller do
  describe '#index' do
    before { get :index }

    it 'response with status: OK' do
      expect(response.status).to eq(200)
    end
  end

  describe '#create' do
    before { post :create, params: params }

    let(:params) do
      { start_date: Date.current, end_date: Date.current + 1, description: 'New event' }
    end

    it 'response with status: No content' do
      expect(response.status).to eq(204)
    end

    it 'create new event' do
      expect(Event.count).to eq(1)
    end
  end
end
