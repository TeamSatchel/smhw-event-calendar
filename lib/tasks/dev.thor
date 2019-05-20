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
    raise StandardError.new('DO NOT POPULATE PRODUCTION') if Rails.env.production? && !ENV['STAGING']

    result = User::Create.new(user: { name: 'Carl Jung', email: 'carl.jung@test.com' }).call.user
  end
end