require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) { FactoryBot.create(:event) }

  it "is valid with valid attributes" do
    expect(event).to be_valid
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(Event::ATTRIBUTE_LIMIT[:title]) }
    it { should validate_length_of(:description).is_at_most(Event::ATTRIBUTE_LIMIT[:description]) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it "is not valid with invalid start or end date" do
      event.start_date = Faker::Date.forward(23)
      event.end_date = Faker::Date.backward(14)
      event.valid?
      event.errors.messages[:start_date].should include(Event::VALIDATION_MESSAGES[:start_date])
    end
  end
end
