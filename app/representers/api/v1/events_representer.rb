class Api::V1::EventsRepresenter < Api::BaseCollectionRepresenter
  items decorator: Api::V1::EventRepresenter
end
