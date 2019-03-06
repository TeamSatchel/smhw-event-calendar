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
    event.start_date = form.start_date if form.start_date.present?
    event.end_date = form.end_date if form.end_date.present?
    event.description = form.description.to_s if form.description.to_s.present?
    if event.save
        broadcast(:ok)
    else
        broadcast(:invalid)
    end
  end
  
end