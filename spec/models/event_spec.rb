require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:create_params) do
    {
        title: "Title",
        start_at: Date.today,
        end_at: Date.today + 1.day
    }
  end

  context "with valid params" do
    it "is valid with valid attributes" do
      expect(Event.new(create_params)).to be_valid
    end

    it "events count shod be changed" do
      expect { Event.create(create_params) }.to change{ Event.count }.by(1)
    end
  end

  context "with not valid params" do
    it "is not valid with valid attributes" do
      expect(Event.new).not_to be_valid
    end

    it "is not valid with not valid title" do
      create_params[:title] = nil
      expect(Event.new(create_params)).not_to be_valid
    end

    it "is not valid with valid date" do
      create_params[:end_at] = Date.today - 20.days
      expect(Event.create(create_params).errors.full_messages.join(", ")).to include "Start date have to be less than end date"
    end
  end
end
