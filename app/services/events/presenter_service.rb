module Events
  class PresenterService
    def self.events
      Event.on_current_week.to_a
    end
  end
end
