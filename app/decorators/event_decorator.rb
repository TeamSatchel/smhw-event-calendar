class EventDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    {
      id: id,
      title: title,
      start: start_date,
      end: end_date
    }
  end
end
