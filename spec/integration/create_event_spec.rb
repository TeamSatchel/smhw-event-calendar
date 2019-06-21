require 'rails_helper'

feature 'Creating event' do
  context 'valid event' do
    before(:each) do
      @calendar = create(:calendar, color: 'green')
    end

    scenario 'create valid event', js: true do
      visit events_path
      find('a[name="create-event"]').click
      find(:css, '[name="calendarValue"]').find(:option, @calendar.name).select_option
      fill_in 'Title', with: 'test title'
      fill_in 'Description', with: 'test descr'
      find('input[type="submit"]').click

      expect(page).to have_css('.fc-event-container .fc-title', exact_text: 'test title')
      expect(page).to have_css('.fc-event-container .fc-description', exact_text: 'test descr')
      expect(find('.fc-event-container .fc-day-grid-event')[:style]).to match(/color: green/)
    end
  end

  context 'invalid event' do
    scenario 'create event without calendar', js: true do
      visit events_path
      find('a[name="create-event"]').click
      fill_in 'Title', with: 'test title'
      fill_in 'Description', with: 'test descr'
      find('input[type="submit"]').click

      expect(page).to have_css('.error-label', exact_text: 'Calendar must exist')
    end
  end
end
