require 'rails_helper'

describe Event do
  context 'validation works correct' do
    it do
      subject.valid?
      expect(subject.errors[:title]).to include("can't be blank")
    end
  end

  context 'validation works correct' do
    it do
      subject.title = Faker::Lorem.sentence(2)
      subject.start_at = Faker::Time.forward(2, :afternoon)
      subject.end_at = Faker::Time.forward(3, :afternoon)

      subject.valid?
      expect(subject.errors.empty?).to be_truthy
    end
  end
end