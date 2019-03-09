class Api::V1::EventRepresenter < Api::BaseRepresenter
  property :id
  property :title
  property :description
  property :start_date
  property :end_date
end
