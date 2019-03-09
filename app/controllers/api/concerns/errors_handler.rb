module Api
  module Concerns
    module ErrorsHandler
      extend ActiveSupport::Concern

      included do
        rescue_from ActiveRecord::RecordNotFound do |e|
          render_error(404, e.message)
        end

        rescue_from ActiveRecord::RecordInvalid do |e|
          render_error(422, e.message)
        end

        rescue_from ActionController::ParameterMissing do |e|
          render_error(422, e.message)
        end
      end
    end
  end
end
