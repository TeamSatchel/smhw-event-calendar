Event.delete_all

Event.create title: 'Meeting with Team Satchel', location: 'Copenhagen',
  description: 'First meeting', start_date: 2.days.from_now,
  end_date: 5.days.from_now

Event.create title: 'Sprint review meeting', location: 'London',
  description: 'Second meeting', start_date: Date.today,
  end_date: 4.days.from_now
