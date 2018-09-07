# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Event.create(description: "First event", start_at: Date.today, end_at: Date.today + 1.day)
Event.create(description: "Second event", start_at: Date.today + 2.days, end_at: Date.today + 5.days)
