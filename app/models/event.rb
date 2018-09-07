class Event < ActiveRecord::Base
  def start_time
    self.start_at
  end

  def end_time
    self.end_at
  end
end
