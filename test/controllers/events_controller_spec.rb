require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'returns json' do
      get :index, params: { format: :json }
      expect(response.content_type).to eq('application/json')
    end

    it 'responds with a hash with root element events with array value' do
      get :index, params: { format: :json }
      json_result = JSON.parse(response.body)
      expect(json_result.has_key? 'events').to eq(true)
      expect(json_result['events']).to be_an(Array)
    end
  end

  describe 'POST create' do
    context 'with valid parameters' do

      let(:valid_params) do
        {
           event: {
            description: 'Fake valid event',
            start_time:  Date.today,
            end_time:    Date.today + 1.day,
          },
          format: :json
        }
      end

      it 'creates a new event' do
        expect { post :create, ActionController::Parameters.new(valid_params)}.to change(Event, :count).by(+1)
        expect(response).to have_http_status :created
      end

      it 'creates an event with the correct attributes' do
         post :create, ActionController::Parameters.new(valid_params)
         expect(Event.last.description).to eq valid_params[:event][:description]
         expect(Event.last.start_time.to_date).to eq valid_params[:event][:start_time]
         expect(Event.last.end_time.to_date).to eq valid_params[:event][:end_time]
      end

      it 'responds with created object' do
        post :create, ActionController::Parameters.new(valid_params)
        expect(JSON.parse(response.body).has_key? 'event').to eq(true)
      end

    context 'with invalid parameters' do
      let(:invalid_params) do
        {
          event: {
            desription: 'Fake valid event',
            start:  Date.today,
            end:    Date.today + 1.day,
          }
        }
      end

      it 'crashes without params' do
        expect {
          post :create
        }.to raise_exception(ActionController::ParameterMissing)
      end

      it 'fails to create a new event' do
        expect { post :create, ActionController::Parameters.new(invalid_params) }.to_not change(Event, :count)
        expect(response).to have_http_status :unprocessable_entity
      end

      it 'and returns error messages' do
        post :create, ActionController::Parameters.new(invalid_params)
        expect(JSON.parse(response.body).has_key? 'message').to eq(true)
        expect(JSON.parse(response.body)['message'].present?).to eq(true)
      end

    end
  end
end
end
