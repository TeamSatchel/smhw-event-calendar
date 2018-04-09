require 'test_helper'

class EventsTest < ActionDispatch::IntegrationTest
  test 'can see events on index page' do
    get '/'
    assert_select 'div', 'Test event'
  end

  test 'can see event create form' do
    get '/'
    assert_select 'label', 'event title:'
  end
end
