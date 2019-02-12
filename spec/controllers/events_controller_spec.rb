require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let!(:event) { create :event }

  describe "GET events#index" do
    let!(:get_request) { get :index }

    it 'response should be success' do
      expect(response).to be_success
    end

    it 'response should eq Events count' do
      response_body = JSON.parse(response.body)
      expect(response_body.size).to eq Event.count
    end
  end

  describe "POST events#create" do
    let(:post_request) { post :create, event: create_params }
    let(:create_params) do
        {
            title: "Title",
            start_at: Date.today,
            end_at: Date.today + 1.day
        }
      end

    it 'Shoud create new event' do
      post_request
      expect(response).to be_success
    end

    it "Shoudn't create new event(title)" do
      create_params[:title] = nil
      post_request
      expect(response.status).to eq 422
    end

    it "Shoudn't create new event(date)" do
      create_params[:end_at] = Date.today - 20.days
      post_request
      expect(response.body).to include "Start date have to be less than end date"
    end
  end
end