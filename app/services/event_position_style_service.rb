class EventPositionStyleService
  def initialize(event, week_start, week_end)
    @event = event
    @week_start = week_start
    @week_end = week_end
  end

  def perform
    "margin-left:#{margin_left}%; width:#{width}%;"
  end

  private
  def margin_left
    1 + (@event.start_date - @week_start).to_i * 14.2
  end

  def width
    (13.8 * (([@event.end_date, @week_end].min - @event.start_date).to_i + 1)).to_i
  end
end
