class GetEvents < Rectify::Query
  
  def initialize(date = nil)
    @date = date
  end

  def query
    now = Time.zone.now.to_datetime
    if @date.present?
        now = @date
    end
    from = now.beginning_of_week
    to = now.end_of_week
    Event.where(event_start: from..to).order(created_at: :asc)
  end
  
end
