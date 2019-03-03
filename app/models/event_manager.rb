class EventManager
  def initialize(model, calendar_type)
    @model = model
    @calendar_type = calendar_type
  end

  def get_all_calendar_events
    @model.where('end_at >= ? AND start_at <= ?',
                 @calendar_type.date_range.first.beginning_of_day,
                 @calendar_type.date_range.last.end_of_day)
  end
end