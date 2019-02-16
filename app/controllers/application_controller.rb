class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def error_messages(resource)
    errors = resource.errors
    return if errors.empty?

    errors.full_messages.join(', ')
  end
end
