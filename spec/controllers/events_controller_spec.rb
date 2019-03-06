require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  
  let!(:event_test) { FactoryBot.create(:event) }
  
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "this endpoint should return created event" do
      post :create, params: { }, format: :js
      expect(response).to be_successful#have_http_status(200)
    end
  end


end
