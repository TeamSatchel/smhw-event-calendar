class EventsController < ApplicationController
  before_action :initialize_resource, only: :new

  before_action :build_resource, only: :create

  def create
    render :errors unless resource.save
  end

  private
  def collection
    @collection ||= Event.all
  end

  def resource
    @resource
  end

  def initialize_resource
    @resource = Event.new
  end

  def resource_params
    params.require(:event).permit(:title, :start_date, :end_date, :teacher_name, :description)
  end

  def build_resource
    @resource = Event.new resource_params
  end
end
