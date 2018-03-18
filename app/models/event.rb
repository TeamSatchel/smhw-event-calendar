class Event < ActiveRecord::Base

  scope :actual, -> {
    where("start_date BETWEEN :beginning_of_week
      AND :end_of_week
      OR start_date < :beginning_of_week
      AND end_date BETWEEN :beginning_of_week
      AND :end_of_week
      OR end_date > :beginning_of_week",
      beginning_of_week: DateTime.current.beginning_of_week, end_of_week: DateTime.current.end_of_week)
  }
end
