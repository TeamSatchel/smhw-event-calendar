class EventSerializer < ActiveModel::Serializer
  attributes :id, :description, :start_time, :end_time
end
