RSpec.describe Event, type: :model do
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:start_date) }
  it { is_expected.to validate_presence_of(:end_date) }

  describe 'scopes' do
    it '#on_current_week' do
      create(:event, start_date: Date.current.beginning_of_week - 1)
      enemy_event = create(:event, start_date: Date.current)
      create(:event, start_date: Date.current.end_of_week + 1, end_date: Date.current.end_of_week + 2)
      expect(Event.on_current_week).to eq([enemy_event])
    end
  end

  it '#end_date_is_after_start_date' do
    expect(build(:event, start_date: Date.current + 1, end_date: Date.current)).not_to be_valid
  end
end
