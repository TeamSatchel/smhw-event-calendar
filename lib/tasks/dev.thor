# encoding: utf-8

class Dev < Thor
  include Thor::Actions

  desc "redodb", "Nuke the database and repopulate"
  def redodb
    run("puma-dev -stop")
    run("rails db:environment:set RAILS_ENV=development && rails db:drop db:create db:migrate db:test:prepare")
    invoke :populate
  end


  desc "populate", "Create some data"
  def populate
    require './config/environment'

    user = User::Create.new(user: { name: 'Carl Jung', email: 'carl.jung@test.com' }).call.user

    5.times do |i|
      start_date = Date.current.advance(days: (0..3).to_a.sample, hours: (0..23))
      end_date   = start_date.advance(days: (0..3).to_a.sample, hours: (0..23))

      Event::Create.new(user: user, event: { title: "Event #{i}", start_date: start_date, end_date: end_date, description: 'lorem ipsum dolor' }).call
    end
  end

  desc "deploy", "Deploy code"
  def deploy
    run('git push heroku gonzalo-rodriguez:master')
    run("heroku pg:reset DATABASE --confirm satchel-example")
    run("heroku run rake db:migrate")
    run("heroku run thor dev:populate")
  end


end