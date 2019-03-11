require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should create an event' do
    assert_difference('Event.count') do
      post :create, format: :js, event: { title: 'New Event', description: 'Description for event', start_date: Time.now, end_date: Time.now + 2.days }
    end

    assert_response :success
  end
end
