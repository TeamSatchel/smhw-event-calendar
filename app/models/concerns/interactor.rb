require 'hanami/interactor'

module Interactor
  extend ActiveSupport::Concern

  included do
    include Hanami::Interactor
  end

  def validate(model)
    if !model.valid?
      r = {}
      r[model.class.to_s.underscore] = model.errors.messages
      error!(r)
    end
  end
end