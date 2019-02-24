module Events
  class CrudService
    class << self
      def new_event(params)
        new(params: params).call
      end

      def update_event(params)
        event = Event.find_by(id: params[:id])
        new(event, params: params).call
      end
    end

    attr_reader :event

    def initialize(event = nil, params:)
      @event  = event
      @params = params
    end

    def call
      event&.assign_attributes(permit_attributes)
      save_event_attributes!
      self
    end

    def errors?
      !event.errors.empty?
    end

    def error_messages
      event.errors.full_messages.join(', ')
    end

    private

    attr_reader :params

    def save_event_attributes!
      (event || build_new_event).save
    end

    def build_new_event
      @event = Event.new(
        start_date: parse_date(params[:start_date]),
        end_date: parse_date(params[:end_date]),
        title: params[:title],
        description: params[:description],
        signature: params[:signature]
      )
    end

    def parse_date(date)
      Date.iso8601(date.to_s)
    rescue ArgumentError
      nil
    end

    def permit_attributes
      params.permit(:start_date, :end_date, :title, :description, :signature)
    end
  end
end
