class Event::Create
  include Interactor

  expose :event, :user

  def initialize(event:, user:)
    @event_params = event
    @user         = user
  end

  def call
    @event = Event.new(@event_params.merge(user_id: @user.id))

    validate(@event)

    @event.save!
  end

end
