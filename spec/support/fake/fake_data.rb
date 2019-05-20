RSpec.shared_context "Fake data" do

  let(:user_params) do
    { name: 'Carl Jung', email: 'carl.jung@test.com' }
  end

  let(:user) do
    User::Create.new(user: user_params).call.user
  end

  let(:event_params) do
    { title: 'Awesome event', start_date: Date.current, end_date: Date.current.advance(days: 2), description: 'lorem ipsum dolor' }
  end

  let(:event) do
    Event::Create.new(user: user, event: event_params).call.event
  end

end