require 'rails_helper'

describe EventsController do
  context "GET index" do

    let(:ended_event) { FactoryBot.create(:event, :ended) }
    let(:event_in_future) { FactoryBot.create(:event, :in_future) }
    let(:event) { FactoryBot.create(:event, :two_weeks) }
    let(:second_event) { FactoryBot.create(:event, :start_and_end_on_this_week) }
    let(:third_event) { FactoryBot.create(:event, :start_on_this_end_on_next_week) }
    let(:fourth_event) { FactoryBot.create(:event, :start_on_previous_week_end_on_this) }

    it "assigns only actual events @events" do
      get :index
      expect(assigns(:events)).to eq([event, second_event, third_event, fourth_event])
      expect(assigns(:events).count).to eq(4)
      expect(assigns(:events).include?(ended_event)).to eq(false)
      expect(assigns(:events).include?(event_in_future)).to eq(false)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
