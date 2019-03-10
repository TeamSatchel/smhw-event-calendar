require 'rails_helper'

RSpec.describe Api::V1::EventsController, type: :controller do

  describe "GET #index" do
    context "when success" do
      before(:each) do
        @event_1 = create(:event)
        @event_2 = create(:event)
      end

      it "render an array of events with particular event" do
        get :index, params: {}
        json_response = JSON.parse(response.body)
        json_data = json_response
        expect(json_data['data'].length).to eql 2
        expect(json_data['data']).to be_an(Array)

        json_event = json_data['data'][0]

        expect(json_event['id']).to eql @event_1.id
        expect(json_event['title']).to eql @event_1.title
        expect(json_event['description']).to eql @event_1.description
        expect(json_event['start'].to_datetime.to_i).to eql @event_1.start_date.to_i
        expect(json_event['end'].to_datetime.to_i).to eql @event_1.end_date.to_i
        expect(json_response['meta']['code']).to eql 200
      end
    end
  end

  describe "POST #create" do
    before(:each) {
      @event_attributes = FactoryBot.attributes_for(:event)
    }

    context "when is successfully created" do

      it "render created event" do
        post :create, @event_attributes.as_json
        json_response = JSON.parse(response.body)
        json_data = json_response['data']
        expect(json_data['title']).to eql @event_attributes[:title]
        expect(json_data['description']).to eql @event_attributes[:description]
        expect(json_data['start'].to_datetime.to_i).to eql @event_attributes[:start_date].to_datetime.to_i
        expect(json_data['end'].to_datetime.to_i).to eql @event_attributes[:end_date].to_datetime.to_i
        expect(json_response['meta']['code']).to eql 201
      end
    end

    context "when has error" do
      it "render unprocessable_entity error when required event param is missing or empty" do
        @event_attributes[:title] = ""
        post :create, @event_attributes.as_json
        json_response = JSON.parse(response.body)
        json_data = json_response['data']
        expect(json_data.blank?).to eql true
        expect(json_response['meta']['code']).to eql 422
        expect(json_response['meta']['message'].join(', ').downcase).to include "title"
      end
    end
  end
end
