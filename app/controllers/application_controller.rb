class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :thou_shall_be_log_in
  before_action :require_login

  def thou_shall_be_log_in
    auto_login(User.first)
  end

  add_flash_types :success, :error, :warning

  def present_errors(result)
    errors = result.errors.select { |c| !c.kind_of?(Hash) }
    if errors.present?
      flash.now[:error] = errors.first.to_s
    end

    errors = result.errors.select { |c| c.kind_of?(Hash) }

    if errors.present?
      if errors.first[:warning].present?
        flash.now[:warning] = errors.first[:warning]
      else
        flash.now[:error] = I18n.t('simple_form.error_notification.default_top_message')
      end
    end
  end
end
