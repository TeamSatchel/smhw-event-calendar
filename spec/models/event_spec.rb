# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  context do
    shared_examples :check_invalidity do |event|
      it { expect(event).to be_invalid }
    end

    shared_examples :check_validity do |event|
      it { expect(event).to be_valid }
    end

    context 'without a title' do
      include_examples :check_invalidity, Event.new(title:       nil,
                                                    description: 'Description',
                                                    start_date:  Date.today,
                                                    end_date:    Date.today)
    end

    context 'without a start_date' do
      include_examples :check_invalidity, Event.new(title:       'Title',
                                                    description: 'Description',
                                                    start_date:  nil,
                                                    end_date:    Date.today)
    end

    context 'without an end_date' do
      include_examples :check_invalidity, Event.new(title:       'Title',
                                                    description: 'Description',
                                                    start_date:  Date.today,
                                                    end_date:    nil)
    end

    context 'if a title is too long' do
      TITLE = 'a' * (Event::MAX_TITLE_LENGTH + 1)

      include_examples :check_invalidity, Event.new(title:       TITLE,
                                                    description: 'Description',
                                                    start_date:  Date.today,
                                                    end_date:    Date.today)
    end

    context 'if a description is too long' do
      DESCRIPTION = 'a' * (Event::MAX_DESCRIPTION_LENGTH + 1)

      include_examples :check_invalidity, Event.new(title:       'Title',
                                                    description: DESCRIPTION,
                                                    start_date:  Date.today,
                                                    end_date:    Date.today)
    end

    context 'if end_date before start_date' do
      include_examples :check_invalidity, Event.new(title:       'Title',
                                                    description: 'Description',
                                                    start_date:  Date.today,
                                                    end_date:    Date.yesterday)
    end

    context 'without a description' do
      include_examples :check_validity, Event.new(title:       'Title',
                                                  description: nil,
                                                  start_date:  Date.today,
                                                  end_date:    Date.today)
    end

    context 'with all valid attributes' do
      include_examples :check_validity, Event.new(title:       'Title',
                                                  description: 'Description',
                                                  start_date:  Date.today,
                                                  end_date:    Date.today)
    end
  end

  describe '#date_ranged' do
    before :each do
      5.times do
        Event.create(title: 'Title',
                     start_date: Date.today,
                     end_date:   Date.today)
      end

      Event.create(title: 'Title',
                   start_date: Date.today + 1.week,
                   end_date:   Date.today + 1.week)
    end

    it 'returns all records if no params passed' do
      expect(Event.date_ranged.to_a).to eql(Event.first(5))
    end

    it 'returns all records for a given :start and :end' do
      events = Event.date_ranged(start: Date.today + 1.week,
                                 end:   Date.today + 1.week)

      expect(events.to_a).to eql([Event.last])
    end
  end

  describe '#serialize' do
    let!(:event) do
      Event.create(title:       'Title',
                   description: 'Description',
                   start_date:   Date.today,
                   end_date:     Date.today)
    end

    it 'returns an array of hashes' do
      expect(Event.limit(1).serialize).to       be_kind_of(Array)
      expect(Event.limit(1).serialize.first).to be_kind_of(Hash)
    end
  end

  describe '.serialize!' do
    let(:event) do
      Event.create(title:       'Title',
                   description: 'Description',
                   start_date:   Date.today,
                   end_date:     Date.today)
    end

    it 'generates proper hashe' do
      target = {
        'title'       => 'Title',
        'description' => 'Description',
        'start'       => Date.today,
        'end'         => Date.today,
        'color'       => event.color
      }

      expect(event.serialize!).to eql(target)
    end
  end
end
