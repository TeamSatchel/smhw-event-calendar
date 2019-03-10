class Api::BaseRepresenter < Roar::Decorator
  include Roar::JSON
  include Roar::Hypermedia
end
