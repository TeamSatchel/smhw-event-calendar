require 'rails_helper'

describe "Events" do
  it "Creates an event" do
    user

    visit('/')
    click_link 'Create event'

    fill_in 'Title', with: 'Woot!'
    fill_in 'Description', with: 'Treasure'

    click_button 'Save changes'

    expect(page).to have_content('Woot!')
    expect(page).to have_content('Treasure')
    expect(page).to have_content(user.name)
  end
end