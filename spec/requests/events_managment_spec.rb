require "rails_helper"

RSpec.describe "Events management", type: :request do
  describe 'POST#create' do
    context 'when valid params' do
      it 'creates event record' do
        post "/events", params: { event: { description: 'My event', start_at: DateTime.current, end_at: DateTime.tomorrow } }

        expect(response.body).to eq ''
        expect(response.status).to eq 201
      end
    end

    context 'when invalid params' do
      it 'does not create event record' do
        post "/events", params: { event: { description: '', start_at: DateTime.current, end_at: DateTime.tomorrow } }

        expect(response.status).to eq 422
      end
    end
  end
end