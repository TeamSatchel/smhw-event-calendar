require 'rails_helper'

describe EventsController, type: :controller do
  render_views

  before do
    WebMock.allow_net_connect!
  end

  after do
    WebMock.disable_net_connect!
  end

  describe '#index' do
    let!(:event) { FactoryBot.create :event }
    let(:send_request) {  get :index, format: :json }

    it 'gives successfull response' do
      send_request

      expect(response).to be_success
    end

    it 'returns correct event values' do
      send_request

      response_body = JSON.parse(response.body).first

      expect(response_body['title']).to eq(event.title)
      expect(response_body['description']).to eq(event.description)
      expect(response_body['start'].to_date).to eq(event.start_at.to_date)
      expect(response_body['end'].to_date).to eq((event.end_at + 1.day).to_date)
    end
  end

  describe '#create' do
    let(:send_request) { post :create, format: :json, event: create_params }
    let(:create_params) do
      {
        title: 'Valid title',
        description: 'Valid description',
        start_at: Time.now - 1.day,
        end_at: Time.now + 1.day
      }
    end

    context 'when valid params' do
      it 'user can create the event' do
        send_request

        expect(response).to be_success
      end
    end

    context 'when invalid params' do
      it 'user can\'t create event entering invalid date\'s range' do
        create_params[:start_at] = Time.now + 1.day
        create_params[:end_at] = Time.now - 1.day
        send_request

        expect(response.status).to eq 422
      end

      it 'user can\'t create event without title' do
        create_params[:title] = nil
        send_request

        expect(response.status).to eq 422
      end

      it 'user can\'t create event without description' do
        create_params[:description] = nil
        send_request

        expect(response.status).to eq 422
      end

      it 'user can\'t create event without start_at' do
        create_params[:start_at] = nil
        send_request

        expect(response.status).to eq 422
      end

      it 'user can\'t create event without end_at' do
        create_params[:end_at] = nil
        send_request

        expect(response.status).to eq 422
      end
    end
  end
end
