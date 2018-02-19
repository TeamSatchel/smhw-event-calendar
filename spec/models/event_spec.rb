require 'rails_helper'

RSpec.describe Event do
  describe 'end_date no sooner than start_date' do
    let(:description) { 'Test' }
    let(:early_date) { Date.new(2018, 2, 1) }
    let(:later_date) { Date.new(2018, 2, 3) }

    it 'is not valid without a description' do
      expect(described_class.new(
               start_date: early_date,
               end_date: later_date
      )).to_not be_valid
    end

    it 'is not valid without a start date' do
      expect(described_class.new(
               description: description,
               end_date: later_date
      )).to_not be_valid
    end

    it 'is not valid without an end date' do
      expect(described_class.new(
               description: description,
               start_date: early_date
      )).to_not be_valid
    end

    it 'is valid when the end_date is later than the start_date ' do
      expect(described_class.new(
               description: description,
               start_date: early_date,
               end_date: later_date
      )).to be_valid
    end

    it 'is valid when the end_date is the same as the start_date ' do
      expect(described_class.new(
               description: description,
               start_date: early_date,
               end_date: early_date
      )).to be_valid
    end

    it 'is not valid when the end_date is earlier than the start_date ' do
      expect(described_class.new(
               description: description,
               start_date: later_date,
               end_date: early_date
      )).to_not be_valid
    end
  end
end
