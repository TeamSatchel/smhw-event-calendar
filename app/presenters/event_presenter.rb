class EventPresenter

  attr_reader :event

  def initialize(event)
    @event = event
  end

  def settings
    settings = { length: 7, right_offset: 0, left_offset: 0 }
    if event.start_date.to_date <= Date.current.beginning_of_week
      unless event.end_date.to_date >= Date.current.end_of_week
        settings[:right_offset] = (Date.current.end_of_week - event.end_date.to_date).to_i
        settings[:length] = (Date.current.beginning_of_week..event.end_date.to_date).to_a.size
      end
    else
      if event.end_date.to_date >= Date.current.end_of_week
        settings[:length] = (event.start_date.to_date..Date.current.end_of_week).to_a.size
        settings[:left_offset] = (event.start_date.to_date - Date.current.beginning_of_week).to_i
      else
        settings[:right_offset] = (Date.current.end_of_week - event.end_date.to_date).to_i
        settings[:left_offset] = (event.start_date.to_date - Date.current.beginning_of_week).to_i
        settings[:length] = 7 - settings[:right_offset] - settings[:left_offset]
      end
    end
    settings
  end

end
