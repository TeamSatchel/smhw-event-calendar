# frozen_string_literal: true

require 'rails_helper'

describe EventsController do
  context '#create' do
    it 'is available for everyone' do
      post :create, xhr: true
      expect( response ).to have_http_status( :success )
    end
  end
end
