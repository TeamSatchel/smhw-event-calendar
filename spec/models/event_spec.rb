require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'Validations' do
    context 'presence' do
      describe '#presence title' do
        it { should validate_presence_of(:title) }
      end

      describe '#presence description' do
        it { is_expected.to validate_presence_of(:description) }
      end

      describe '#presence start_at' do
        it { is_expected.to validate_presence_of(:start_at) }
      end

      describe '#presence end_at' do
        it { is_expected.to validate_presence_of(:end_at) }
      end
    end

    describe '#date_range_validity' do
      let(:event) do
        FactoryBot.build(:event, start_at: Date.tomorrow, end_at: Date.today)
      end

      it 'returns correct error message' do
        event.valid?

        event.errors.messages[:date_range_validity].should include(I18n.t('errors.date_range_validity_error'))
      end
    end
  end
end
