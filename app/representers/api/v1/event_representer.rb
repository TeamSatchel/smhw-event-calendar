class Api::V1::EventRepresenter < Api::BaseRepresenter
  property :id
  property :title
  property :description
  property :start, getter: lambda { |args| start_date }
  property :end, getter: lambda { |args| end_date }
end
