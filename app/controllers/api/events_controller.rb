require './lib/calendar_date'
require_relative 'api_controller'

class Api::EventsController < ApiController
  DEFAULT_START_DATE = Date.today
  DEFAULT_INTERVAL_DAYS = 6

  def index
    load_dates

    @events = Event.within_range(@start_date, @end_date)

    render json: {
      events: @events,
      display_dates: display_dates,
      previous_date: @start_date.prev_day,
      next_date: @start_date.next_day
    }
  end

  def create
    event = Event.new(event_params)

    if event.save
      render json: { event: event }, status: 200
    else
      render json: { errors: event.errors }, status: 400
    end
  end

  private

  def event_params
    params.require(:event).permit(:description, :start_date, :length_days)
  end

  def load_dates
    @start_date = if params[:start_date]
                    Date.parse(params[:start_date])
                  else
                    DEFAULT_START_DATE
                  end

    @end_date = @start_date.next_day(DEFAULT_INTERVAL_DAYS)
  end

  def display_dates
    (@start_date..@end_date).map { |day| CalendarDate.new(day).to_h }
  end
end
