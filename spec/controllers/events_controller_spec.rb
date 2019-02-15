# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET #index' do
    it 'responds to html' do
      expect(get(:index)).to have_http_status(:ok)
    end

    it 'responds to json' do
      get :index, format: :json

      expect(response).to              have_http_status(:ok)
      expect(response.content_type).to eql('application/json')
    end

    it 'should initialize a new event object' do
      get :index

      expect(assigns(:new_event)).to be_a_new(Event)
    end
  end

  describe 'POST #create' do
    shared_examples :post_create do |count, status|
      let(:run_action) { post :create, params: { event: attributes } }

      it "creates #{count} new record(s)" do
        expect { run_action }.to change(Event, :count).by(count)
      end

      it "responds with JSON and #{status} status" do
        run_action
        expect(response).to              have_http_status(status)
        expect(response.content_type).to eql('application/json')
      end
    end

    context 'with invalid params' do
      let(:attributes) do
        {
          title:       nil,
          description: nil,
          start_date:  Date.today,
          end_date:    Date.today
        }
      end

      include_examples :post_create, 0, :unprocessable_entity
    end

    context 'with valid params' do
      let(:attributes) do
        {
          title:       'Title',
          description: 'Description',
          start_date:  Date.today,
          end_date:    Date.today
        }
      end

      include_examples :post_create, 1, :ok
    end
  end
end
