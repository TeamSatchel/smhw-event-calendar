RSpec.describe EventsController, type: :controller do
  describe '#index' do
    before { get :index }

    it 'response with status: OK' do
      expect(response.status).to eq(200)
    end
  end
end
