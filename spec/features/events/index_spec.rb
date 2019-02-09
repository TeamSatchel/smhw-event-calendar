require 'rails_helper'

describe 'events index', js: true do
  context 'when visiting index page' do
    it 'shows calendar with \'Create Event\' button' do
      visit '/events'

      expect(page).to have_css('div#calendar')
      expect(page).to have_content(I18n.t('events.index.create_event'))
    end
  end
end
