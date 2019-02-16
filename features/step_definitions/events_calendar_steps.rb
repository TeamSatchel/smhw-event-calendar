When(/\AUser visit the events-calendar page\z/) do
  visit events_path
end

Then(/\Ahe one the events-calendar\z/) do
  expect(page).to have_current_path(events_path)
end

And(/\Ahe see the related calendar\z/) do
  expect(page).to have_css('#calendar')
end

When(/\Ahe fill_in the "(.+)" of new event with: "(.+)"\z/) do |name, value|
  within('#add_event_form') do
    fill_in(name, with: value)
  end
end

And(/\Ahe click the button "(.+)"\z/) do |button|
  page.find('button', text: button).click
end

Then(/\Ahe see related event on the weekly calendar: "(.+)"/) do |event|
  within('#calendar') do
    expect(page).to have_content(event)
  end
end
