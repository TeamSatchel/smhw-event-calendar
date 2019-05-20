class Event::Remove
  include Interactor

  expose :event

  def initialize(event_id:)
    @event = Event.find(event_id)
  end

  def call
    @event.destroy!
  end

end
