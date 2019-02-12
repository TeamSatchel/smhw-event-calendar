class HomeController < ApplicationController
  def index
    today = Date.today
    @end_of_week = today.at_end_of_week
    @beginning_of_week = today.at_beginning_of_week
  end
end
