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
end
