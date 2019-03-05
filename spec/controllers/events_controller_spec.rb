require 'rails_helper'

describe EventsController do
  it 'is available before an action' do
    expect(controller).to be_an_instance_of(EventsController)
  end

  context 'index' do
    before(:each) do
      get 'index'
    end

    context 'should be successful' do
      it { expect(response).to be_success }
    end

    context 'renders the index template' do
      it { expect(response).to render_template('index') }
    end

    context 'assigns correct variables' do
      context 'of' do
        it { expect(assigns).to include(*['calendar_type', 'events', 'event', 'calendar']) }
      end

      context 'calendar_type kinds of EventCalendar::Types::Base' do
        it { expect(assigns(:calendar_type)).to be_a(EventCalendar::Types::Base) }
      end

      context 'calendar kinds of EventCalendar::Calendar' do
        it { expect(assigns(:calendar)).to be_a(EventCalendar::Calendar) }
      end

      context 'events kinds of ActiveRecord::Relation' do
        it { expect(assigns(:events)).to be_a(ActiveRecord::Relation) }
      end

      context 'event kinds of Event' do
        it { expect(assigns(:event)).to be_a(Event) }
      end
    end
  end

  context 'POST create' do
    before(:each) do
      post :create, event: attributes_for(:event), format: :json
    end

    context 'creates a new event' do
      it { expect(response.status).to eq(201) }
    end

    context 'response include events html' do
      it { expect(response.header['Content-Type']).to include('application/json') }
      it { expect(JSON.parse(response.body)).to include('events') }
      it { expect(response.body).to match /event/im }
    end

    context 'create is failed' do
      context 'fake post' do
        before(:each) do
          post :create, event: {title: nil}, format: :json
        end

        it { expect(JSON.parse(response.body)['title']).to eq(["can't be blank"]) }
        it { expect(JSON.parse(response.body)['start_at']).to eq(["can't be blank"]) }
        it { expect(JSON.parse(response.body)['end_at']).to eq(["can't be blank"]) }
      end
    end
  end
end