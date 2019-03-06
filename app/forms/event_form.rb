class EventForm < Rectify::Form
  attribute :event_start, DateTime
  attribute :event_end,  DateTime
  attribute :description,  String

  validates :event_start, :presence => true
end