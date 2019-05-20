class Event::Create
  include Interactor

  expose :event

  def initialize(event:)
    @event_params = event
  end

  def call
    @event = Event.new(@event_params)

    validate(@event)

    @event.save!
  end

end
