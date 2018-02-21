module EventsHelper
  def start_of_week
    Time.zone.now.beginning_of_week.to_date
  end
end
