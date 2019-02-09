require 'rails_helper'

describe 'create event', js: true do
  context "clicking 'Create Event' button" do
    it 'shows modal form' do
      visit '/events'

      expect(find('#data-modal', visible: :all).visible?).to be false
      click_button 'Create Event'
      expect(find('#data-modal', visible: :all).visible?).to be true
    end
  end

  context 'submitting form' do
    before(:each) do
      visit '/events'
      click_button 'Create Event'
    end

    context 'with valid data' do
      it 'renders new event in the calendar' do
        fill_in 'Title', with: 'some valid title'
        fill_in 'Description', with: 'some valid description'
        fill_in 'Start at', with: '2019-02-06'
        fill_in 'End at', with: '2019-02-07'

        click_button 'Create'

        expect(page).to have_content 'some valid title'
        expect(page).to have_content 'some valid description'
        expect(all('.fc-event-container').last['colspan']).to eq '2'
      end
    end

    context 'with invalid data' do
      let(:error_message) { 'All fields are required!' }

      context 'with empty inputs' do
        it 'shows error' do
          expect(page).not_to have_content error_message
          click_button 'Create'
          expect(page).to have_content error_message
        end
      end

      it 'disables submit button' do
        expect(page).to have_button('Create', disabled: false)
        click_button 'Create'
        expect(page).to have_button('Create', disabled: true)
      end
    end
  end
end
