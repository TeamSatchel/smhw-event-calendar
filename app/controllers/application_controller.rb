class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :thou_shall_be_log_in
  before_action :require_login

  def thou_shall_be_log_in
    auto_login(User.first)
  end
end
