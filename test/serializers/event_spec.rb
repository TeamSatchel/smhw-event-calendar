require 'rails_helper'

describe EventSerializer do
  it 'creates JSON for the API with root element' do
    serializer =
      EventSerializer.new(
        Event.create!(
          id: 123, description: 'Fake',
          start_time: Date.today, end_time: Date.today + 1.day
        )
      )
    expect(serializer.to_json).to eql(
      {
        event: Event.last.attributes.slice(*%w[id description start_time end_time])
      }.to_json
    )
  end
end
