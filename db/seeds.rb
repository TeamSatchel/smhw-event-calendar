# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
two_weeks_event = Event.create(
  start_date: DateTime.now - 9.days,
  description: "two weeks",
  end_date: DateTime.now + 5.days
)
start_on_previous_week_end_on_this = Event.create(
  start_date: DateTime.now - 9.days,
  description: "start_on_previous_week_end_on_this",
  end_date: DateTime.now - 1.days
)
start_on_this_end_on_next = Event.create(
  start_date: DateTime.now - 2.days,
  description: "start_on_this_end_on_next",
  end_date: DateTime.now + 5.days
)
start_on_this_end_on_this = Event.create(
  start_date: DateTime.now - 3.days,
  description: "start_on_this_end_on_this",
  end_date: DateTime.now - 1.days
)
ended_on_previous_week = Event.create(
  start_date: DateTime.now - 13.days,
  description: "ended",
  end_date: DateTime.now - 9.days
)
started_on_next_week = Event.create(
  start_date: DateTime.now - 13.days,
  description: "started on next weeek",
  end_date: DateTime.now - 9.days
)
