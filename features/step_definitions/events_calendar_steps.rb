When(/\AUser visit the events-calendar page\z/) do
  visit events_path
end

Then(/\Ahe one the events-calendar\z/) do
  expect(page).to have_current_path(events_path)
end

And(/\Ahe see the related calendar\z/) do
  expect(page).to have_css('#calendar')
end

When(/\Ahe fill_in the form fields with the follow values:/) do |fields_table|
  fields_table.hashes.first.each do |input_name, value|
    within('#add_event_form') do
      fill_in(input_name, with: value)
    end
  end
end

And(/\Ahe click the button "(.+)"\z/) do |button|
  page.find('button', text: button).click
end

Then(/\Ahe see related event on the weekly calendar:/) do |fields_table|
  fields_table.column_names.each do |field|
    within('#calendar') do
      expect(page).to have_content(field)
    end
  end
end
