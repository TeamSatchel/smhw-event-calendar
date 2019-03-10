class Api::BaseController < ActionController::API
  include Api::Concerns::ErrorsHandler
  include Api::Concerns::Responder

  respond_to :json
end
