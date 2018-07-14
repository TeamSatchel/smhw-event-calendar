describe Event do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :start_date }
  it { is_expected.to validate_presence_of :end_date }
end
