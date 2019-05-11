# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  description :text             not null
#  start_date  :date
#  end_date    :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Event, type: :model do
  subject { build(:event) }

  it { is_expected.to be_valid }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:start_date) }

    it 'validates :start_date format' do
      is_expected.not_to allow_value('invalid').for(:start_date)
      is_expected.not_to allow_value('2019-05-00').for(:start_date)
      is_expected.not_to allow_value('2019-05-32').for(:start_date)

      is_expected.to allow_value('2019-05-01').for(:start_date)
      is_expected.to allow_value('2019-05-31').for(:start_date)
      is_expected.to allow_value(Date.today).for(:start_date)
    end

    it 'validates :end_date format' do
      date = '2019-05-31'
      subject.start_date = date

      is_expected.not_to allow_value('invalid').for(:end_date)
      is_expected.not_to allow_value('2019-05-32').for(:end_date)
      is_expected.not_to allow_value('2019-31-31').for(:end_date)

      is_expected.to allow_value(date).for(:end_date)
    end

    it 'validates :end_date == :start_date is valid' do
      today = Date.today
      subject.start_date = today

      is_expected.to allow_value(today).for(:end_date)
    end

    it 'validates :end_date > :start_date is valid' do
      today = Date.today
      subject.start_date = today

      is_expected.to allow_value(today + 1.day).for(:end_date)
    end

    it 'validates :end_date < :start_date is invalid' do
      today = Date.today
      subject.start_date = today

      is_expected.not_to allow_value(today - 1.day).for(:end_date)
    end
  end

  describe '#save' do
    context 'when valid' do
      it 'creates a new record' do
        expect { subject.save }.to change { Event.count }.by(1)
      end
    end
  end
end
