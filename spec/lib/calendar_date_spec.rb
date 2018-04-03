require './lib/calendar_date'

describe CalendarDate do
  subject { CalendarDate.new(sunday) }
  let(:sunday) { Date.parse('Sun, 25 Mar 2018') }
  let(:monday) { Date.parse('Mon, 26 Mar 2018') }

  context '#initialize' do
    it 'takes a date' do
      expect(subject.date).to eq(sunday)
    end
  end

  context '#today?' do
    it 'returns true if its date is todays' do
      subject = CalendarDate.new(Date.today)

      expect(subject.today?).to eq(true)
    end

    it 'returns false if its date is not todays' do
      subject = CalendarDate.new(Date.yesterday)

      expect(subject.today?).to eq(false)
    end
  end

  context '#name' do
    it 'returns the name of the day' do
      expect(subject.name).to eq('Sunday')
    end
  end

  context '#weekend?' do
    it 'returns true if the day is on the weekend' do
      expect(subject.weekend?).to eq(true)
    end

    it 'returns false if the day is not on the weekend' do
      subject = CalendarDate.new(monday)

      expect(subject.weekend?).to eq(false)
    end
  end

  context '#day_with_month' do
    it 'returns the day with the month' do
      expect(subject.day_with_month).to eq('25 Mar')
    end
  end

  context '#year' do
    it 'returns the year' do
      expect(subject.year).to eq('2018')
    end
  end

  context '#to_h' do
    it 'returns a hash of all the methods' do
      expect(subject.to_h)
        .to eq(date: subject.date, name: subject.name, weekend: subject.weekend?, day_with_month: subject.day_with_month, year: subject.year, today: subject.today?)
    end
  end
end
