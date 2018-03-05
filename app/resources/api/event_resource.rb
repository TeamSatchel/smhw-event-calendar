class Api::EventResource < JSONAPI::Resource
  attributes :start_date, :end_date, :description
end
