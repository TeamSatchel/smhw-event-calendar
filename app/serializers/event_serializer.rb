# frozen_string_literal: true

class EventSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date, :description
end
