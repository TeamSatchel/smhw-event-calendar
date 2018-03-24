require 'rails_helper'

RSpec.describe Api::EventsController do
  let(:today) { Date.today }
  let(:parsed_response) { (ActiveSupport::JSON.decode response.body).deep_symbolize_keys }

  describe '#index' do
    let(:response_ids) { parsed_response[:events].map { |e| e[:id] } }

    let!(:event_1) { create(:event, start_date: today)                 }
    let!(:event_2) { create(:event, start_date: today.next_day)        }
    let!(:event_3) { create(:event, start_date: today.next_month)      }
    let!(:event_4) { create(:event, start_date: today, length_days: 3) }

    context 'with no params' do
      before { get :index }

      it 'returns json' do
        expect(response.content_type).to eq('application/json')
      end

      it 'returns events up until 7 days after todays date' do
        expect(response_ids).to include(event_1.id, event_2.id)
        expect(response_ids).not_to include(event_3.id)
      end
    end

    context 'with a start_date' do
      before { get :index, params: { start_date: today.next_day } }

      it 'returns events up until 7 days after the start_date' do
        expect(response_ids).to include(event_2.id, event_4.id)
        expect(response_ids).not_to include(event_1.id, event_3.id)
      end
    end
  end

  describe '#create' do
    context 'success' do
      it 'returns a success response' do
        event_params = { start_date: today.to_s, description: 'a new beginning', length_days: 3 }

        expect do
          post :create, params: { event: event_params }
        end.to change { Event.count }.by(1)

        expect(response).to be_success
        expect(parsed_response[:event]).to include(event_params)
      end
    end

    context 'error' do
      it 'returns errors if the params are not valid' do
        expect do
          post :create, params: { event: { start_date: today, length_days: 0, description: nil } }
        end.not_to change { Event.count }

        expect(response).not_to be_success
        expect(parsed_response[:errors])
          .to eq(description: ['can\'t be blank'], length_days: ['must be greater than 0'])
      end
    end
  end
end
