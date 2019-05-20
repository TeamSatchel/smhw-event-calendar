class Event::Update
  include Interactor

  expose :event

  def initialize(event:, event_id:)
    @event        = Event.find(event_id)
    @event_params = event
  end

  def call
    @event.assign_attributes(@event_params)

    validate(@event)

    @event.save!
  end

end
