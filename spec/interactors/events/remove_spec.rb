require 'rails_helper'

describe Event::Remove do

  it 'remove an event' do
    result = Event::Remove.new(event_id: event.id).call

    expect(result).to ok_interaction

    expect(Event.count).to eq(0)
  end

end
