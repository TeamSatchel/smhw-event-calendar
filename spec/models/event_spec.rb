require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#validations' do
    it 'validates presence of description' do
      event = build(:event)

      expect(event.errors.key?(:description)).to be_falsey
    end

    it 'validates presence of start_at' do
      event = build(:event)

      expect(event.errors.key?(:start_at)).to be_falsey
    end

    it 'validates presence of end_at' do
      event = build(:event)

      expect(event.errors.key?(:end_at)).to be_falsey
    end
  end
end
