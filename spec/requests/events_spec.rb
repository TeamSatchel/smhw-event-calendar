describe 'Events requests' do
  let(:body) { JSON.parse response.body }

  describe 'GET index' do
    context 'when there are no events' do
      it 'returns an empty array' do
        get events_path

        expect(response).to be_successful
        expect(body).to be_an Array
        expect(body).to be_empty
      end
    end

    context 'when there are events' do
      it 'returns an array of events' do
        events = create_list :event, 2

        get events_path

        titles = body.map { |event| event['title'] }

        expect(response).to be_successful
        expect(titles).to include events.first.title
        expect(titles).to include events.last.title
      end
    end
  end

  describe 'POST create' do
    context 'when correct event params are submitted' do
      it 'returns created event with 201 http response' do
        date = '2018-07-17'
        params = {
          title: 'Event 1',
          location: 'Gdańsk',
          start_date: date,
          end_date: date
        }

        post events_path, params: { event: params }

        expect(response).to be_successful
        expect(response.code).to eql '201'
        expect(body['title']).to eql params[:title]
      end
    end

    context 'when incorrect event params are submitted' do
      it 'returns 422 http response with error details in body' do
        params = {
          title: 'Event 1',
        }

        post events_path, params: { event: params }

        expect(response).not_to be_successful
        expect(response.code).to eql '422'
        expect(body['errors']).to include 'Start date can\'t be blank'
        expect(body['errors']).to include 'End date can\'t be blank'
      end
    end
  end
end
