require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test 'should respond to index' do
    get :index
    assert_response :success
  end

  test 'should respond to create' do
    post :create, event: { title: 'test new event', start_date: '2018-04-05', end_date: '2018-04-05'}
    assert_response :redirect
  end
end
