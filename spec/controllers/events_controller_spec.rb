# frozen_string_literal: true

require 'rails_helper'

describe EventsController do
  context '#create' do
    it 'is available for everyone' do
      post :create, xhr: true, params: { event: { start: Time.current } }
      expect( response ).to have_http_status( :success )
    end
  end

  context '#index' do
    it 'renders a calendar' do
      get :index
      expect( response ).to have_http_status( :success )
    end

    it 'serves a list of all events' do
      get :index, format: :json
      expect( response ).to have_http_status( :success )
    end
  end
end
