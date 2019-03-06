class CreateEvent < Rectify::Command
  def initialize(form)
    @form = form
  end

  def call
    return broadcast(:invalid) if form.invalid?

    #transaction do
      create_event
    #end

    #broadcast(:ok)
  end

  private

  attr_reader :form

  def create_event
    event = Event.new
    event.event_start = form.event_start if form.event_start.present?
    event.event_end = form.event_end if form.event_end.present?
    event.description = form.description.to_s if form.description.to_s.present?
    if event.save
        broadcast(:ok)
    else
        broadcast(:invalid)
    end
  end
  
end