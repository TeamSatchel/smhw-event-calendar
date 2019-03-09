require 'representable/json/collection'

class Api::BaseCollectionRepresenter < Roar::Decorator
  include Representable::JSON::Collection
  include Roar::JSON
end