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

  describe 'GET #create' do
    context 'if all data is present' do
      before :each do
        post :create, params: {
          event: {
            title: 'Event title',
            description: 'description',
            start_date: '01-02-2019',
            end_date: '02-02-2019',
          },
        }
      end

      it 'returns created and creates the event' do
        expect(response).to have_http_status(:created)
        expect(Event.count).to eq(1)
      end
    end

    context 'if some data is not present' do
      before :each do
        post :create, params: {
          event: {
            title: 'Event title',
            start_date: '01-02-2019',
            end_date: '02-02-2019',
          },
        }
      end

      it 'returns created and does not create the event' do
        expect(response).to have_http_status(:unprocessable_entity)
        expect(Event.count).to eq(0)
      end
    end

    context 'if the dates are not correct' do
      before :each do
        post :create, params: {
          event: {
            title: 'Event title',
            description: 'description',
            start_date: 'no date',
            end_date: '02-02-2019',
          },
        }
      end

      it 'returns created and does not create the event' do
        expect(response).to have_http_status(:unprocessable_entity)
        expect(Event.count).to eq(0)
      end
    end

    context 'if start date is later than end date' do
      before :each do
        post :create, params: {
          event: {
            title: 'Event title',
            description: 'description',
            start_date: '05-02-2019',
            end_date: '02-02-2019',
          },
        }
      end

      it 'returns created and does not create the event' do
        expect(response).to have_http_status(:unprocessable_entity)
        expect(Event.count).to eq(0)
      end
    end
  end
end
