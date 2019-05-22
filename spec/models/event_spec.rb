# frozen_string_literal: true

require 'rails_helper'

describe Event do
  context '#create' do
    it 'saves valid record' do
      expect( described_class.new.save ).to be_truthy
    end
  end
end
