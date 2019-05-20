require 'rails_helper'

describe User::Create do

  it 'Create an user' do
    result = User::Create.new(user: { name: 'Carl Jung', email: 'carl.jung@test.com' }).call

    expect(result).to ok_interaction

    user = result.user

    expect(user.name).to eq('Carl Jung')
    expect(user.email).to eq('carl.jung@test.com')
  end

end
