require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test 'should respond to index' do
    get :index
    assert_response :success
  end

  def event_params
    {title: 'test new event', start_date: '2018-04-05', end_date: '2018-04-05'}
  end

  test 'should respond to create' do
    post :create, event: event_params
    assert_response :redirect
  end

  test 'event creating' do
    assert_difference('Event.count', 1) do
      post :create, event: event_params
    end
  end
end
