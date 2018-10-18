class EventsController < ApplicationController
  def index
    @events = Event.all

    if params[:start].present?
      @events = @events.where('starts_at >= ?', params[:start])
    end

    if params[:end].present?
      @events = @events.where('ends_at >= ?', params[:end])
    end
  end

  def create
    @record = Event.new(event_params)

    if @record.save
      render json: @record
    else
      render json: @record.errors, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :starts_at, :ends_at)
  end
end
