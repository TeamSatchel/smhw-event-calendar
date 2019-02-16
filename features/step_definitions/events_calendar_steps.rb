When(/\Ahe visit the events-calendar page\z/) do
  visit events_path
end

Then(/\Ahe one the events-calendar\z/) do
  expect(page).to have_current_path(events_path)
end

And(/\Ahe see the related calendar\z/) do
  expect(page).to have_css('#event_calendar')
end
