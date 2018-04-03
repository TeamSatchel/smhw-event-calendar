class CalendarDate
  attr_reader :date

  TODAY = Date.today

  def initialize(date)
    @date = date
  end

  def name
    date.strftime('%A')
  end

  def weekend?
    date.on_weekend?
  end

  def day_with_month
    date.to_formatted_s(:short)
  end

  def year
    date.year.to_s
  end

  def today?
    date == TODAY
  end

  def to_h
    {
      date: date,
      name: name,
      weekend: weekend?,
      day_with_month: day_with_month,
      year: year,
      today: today?
    }
  end
end
