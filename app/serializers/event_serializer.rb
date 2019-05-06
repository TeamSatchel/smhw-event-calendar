class EventSerializer < ActiveModel::Serializer
  attributes :id, :description, :start_date, :end_date
end
