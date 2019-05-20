require 'rails_helper'

describe Event::Update do

  it 'update an event' do
    result = Event::Update.new(event_id: event.id, event: { description: 'Woooloooo' }).call

    expect(result).to ok_interaction

    expect(result.event.description).to eq('Woooloooo')
  end

end
