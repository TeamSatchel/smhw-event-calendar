Event.delete_all

Event.create!(
  [
    {
      description: 'The last day on earth',
      start_date: Date.today,
      length_days: 5
    },
    {
      description: 'Judgement day',
      start_date: Date.today.prev_week,
      length_days: 1
    },
    {
      description: 'The first day of the rest of your life',
      start_date: Date.today.next_month,
      length_days: 1
    },
    {
      description: 'Genesis',
      start_date: Date.today,
      length_days: 2
    }
  ]
)

puts 'Events seeded'
