module Events
  class Creator
    def self.new_event(params)
      new(params).call
    end

    def initialize(params)
      @params = params
    end

    def call
      create_new_event!
      event
    end

    def errors
      @errors ||= event_errors
    end

    private

    attr_reader :params

    def create_new_event!
      event.save
    end

    def event
      @event ||= Event.new(
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

    def event_errors
      errors = event.errors
      errors.full_messages.join(', ') unless errors.empty?
    end
  end
end
