class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start, :end

  def start
    object.start_date.to_i * 1000
  end

  def end
    object.end_date.to_i * 1000
  end
end
