require 'rails_helper'

RSpec.describe EventsController do
  describe 'GET #index' do
    context 'returns http success' do
      before :each do
        get :index
      end

      it { expect(response).to have_http_status(:success) }
    end
  end
end
