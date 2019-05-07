class EventsController < ApplicationController
  def index; end

  def new; end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      redirect_to new_event_path,
      flash: { error: @event.errors.full_messages.join(', ') }
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :desctiption, :teacher_name, :start_time, :end_time)
  end
end
