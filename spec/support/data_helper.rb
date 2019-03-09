module DataHelpers
  def clean_db
    Event.destroy_all
  end
end
