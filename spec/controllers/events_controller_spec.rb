require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  include ActiveSupport::Testing::TimeHelpers

  render_views

  describe 'GET #index' do
    let(:time) { Time.zone.local(2018, 11, 24, 01, 04, 44) }

    before { travel_to time }
    after { travel_back }

    let!(:event) { Event.create(title: 'ololo', desc: 'desc', start: time, end: time + 2.hours) }
    subject { get :index, format: :json, params: {start: (time - 3.hours).to_s(:db), end: (time + 3.hours).to_s(:db)} }

    it { is_expected.to have_http_status :ok }

    it 'return events list' do
      subject

      expect(json_response.count).to eq(1)
      expect(json_response).to eq([
                                      {
                                          id: event.id,
                                          title: event.title,
                                          desc: event.desc,
                                          start: event.start.strftime('%Y-%m-%dT%H:%M:%S'),
                                          end: event.end.strftime('%Y-%m-%dT%H:%M:%S'),
                                          allDay: false,
                                          update_url: event_path(event, method: :patch),
                                          edit_url: edit_event_path(event)
                                      }
                                  ])
    end
  end

  describe 'POST #create' do
    let(:time) { Time.zone.local(2018, 11, 24, 01, 04, 44) }

    before { travel_to time }
    after { travel_back }

    subject { post :create, format: :javascript, params: {
        event: {title: 'new', desc: 'new desc', start: time.iso8601, end: (time+2.hours).iso8601}
    } }

    it { is_expected.to have_http_status :ok }

    it 'creates event' do
      subject
      event_created = Event.last

      expect(event_created.title).to eq('new')
      expect(event_created.start.iso8601).to eq(time.iso8601)
      expect(event_created.end.iso8601).to eq((time+2.hours).iso8601)
    end
  end
end
