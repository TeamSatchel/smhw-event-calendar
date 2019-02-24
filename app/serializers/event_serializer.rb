class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start, :end
  def start
    object.start_date
  end
  def end
    object.end_date
  end
end