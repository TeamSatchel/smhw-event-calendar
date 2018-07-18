Event.delete_all

Event.create title: 'Meeting 1', location: 'Copenhagen',
  description: 'Meeting 1', start_date: 2.days.ago,
  end_date: 1.day.from_now

Event.create title: 'Meeting 2', location: 'Warsaw',
  description: 'Meeting 2', start_date: 3.days.ago,
  end_date: 1.days.ago

Event.create title: 'Meeting 3', location: 'Gdansk',
  description: 'Meeting 3', start_date: 1.day.ago,
  end_date: 2.days.from_now

Event.create title: 'Meeting 4', location: 'Paris',
  description: 'Meeting 4', start_date: 3.days.from_now,
  end_date: 3.days.from_now

Event.create title: 'Meeting 5', location: 'London',
  description: 'Meeting 5', start_date: 1.day.from_now,
  end_date: 3.days.from_now

Event.create title: 'Meeting 6', location: 'Budapest',
  description: 'Meeting 6', start_date: 3.days.ago,
  end_date: 3.days.ago

Event.create title: 'Meeting 7', location: 'Madrit',
  description: 'Meeting 7', start_date: Date.today,
  end_date: 2.days.from_now

Event.create title: 'Meeting 8', location: 'Barcelona',
  description: 'Meeting 8', start_date: 2.days.ago,
  end_date: 1.day.ago
