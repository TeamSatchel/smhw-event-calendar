require 'rails_helper'

RSpec.describe Event, type: :model do
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:start_time) }
  it { is_expected.to validate_presence_of(:end_time) }
  it {
    is_expected.to validate_length_of(:description)
      .is_at_most(Event::MAX_DESCRIPTION_LENGTH)
  }
end
