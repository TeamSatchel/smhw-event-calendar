RSpec.shared_context "Interactor Stuff", type: :interactor do

  let(:event_params) do
    { start_date: Date.current, end_date: Date.current.advance(days: 2), description: 'lorem ipsum dolor' }
  end

  let(:event) do
    Event::Create.new(event: event_params).call.event
  end

end