require 'rails_helper'

require 'capybara/dsl'

describe 'events page', :type => :feature do
  # before(:all) do
  #   Capybara.current_driver = :selenium
  # end
  #
  # after(:all) do
  #   Capybara.use_default_driver
  # end

  before do
    @time = Time.now
    @event = Event.create(title: 'ololo', desc: 'desc', start: @time, end: @time + 2.hours)
  end

  it 'have calendar', js: true do
    visit '/events'

    expect(page).to have_content('Events calendar')
    expect(Event.count).to eq(1)
  end

  it 'drag event', js: true do
    visit '/events'
    event = first('.fc-day-grid-event', minimum: 1)
    first_day = find('.fc-day-grid .fc-week:first-child .fc-content-skeleton tbody td:first-child')
    first_day.assert_no_selector('.fc-day-grid-event')

    event.drag_to(first_day)
    first_day.assert_selector('.fc-day-grid-event')
  end
end
