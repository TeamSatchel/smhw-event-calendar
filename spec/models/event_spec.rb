require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Validations' do
    context 'if :title is not defined' do
      let(:event) { build(:event, title: nil) }

      it 'event is invalid' do
        expect(event.valid?).to eq(false)
      end
    end

    context 'if :starts_at is not defined' do
      let(:event) { build(:event, starts_at: nil) }

      it 'event is invalid' do
        expect(event.valid?).to eq(false)
      end
    end

    context 'if :ends_at is not defined' do
      let(:event) { build(:event, ends_at: nil) }

      it 'event is invalid' do
        expect(event.valid?).to eq(false)
      end
    end

    context 'if all necessary fields are defined' do
      let(:event) { build(:event) }

      it 'event should be invalid' do
        expect(event.valid?).to eq(true)
      end
    end
  end
end
