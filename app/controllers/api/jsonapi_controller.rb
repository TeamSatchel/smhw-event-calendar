module Api
  class JSONAPIController < ActionController::Base
    include JSONAPI::ActsAsResourceController
  end
end
