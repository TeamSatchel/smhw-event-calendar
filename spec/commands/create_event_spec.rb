require 'rails_helper'

RSpec.describe CreateEvent, unit: true, type: :command do

  describe CreateEvent do
        
        it "creating a valid event" do
            event_start = Time.zone.now.to_datetime
            event_end = event_start + 30.minutes
            title = "Just testing"
            data = {event_start: event_start, event_end: event_end, description: title}
            form = EventForm.from_params(data)
            result = nil
            CreateEvent.call(form) do
              on(:ok) do
                result = "ok"
              end
              on(:invalid) do
                result = "invalid"
              end
            end
            expect(result).to eq("ok")
        end
        
        it "creating a non valid event" do
            event_start = Time.zone.now.to_datetime
            event_end = event_start + 30.minutes
            title = "Just testing"
            data = {event_start: nil, event_end: event_end, description: title}
            form = EventForm.from_params(data)
            result = nil
            CreateEvent.call(form) do
              on(:ok) do
                result = "ok"
              end
              on(:invalid) do
                result = "invalid"
              end
            end
            expect(result).to eq("invalid")
        end
    
  end
end
