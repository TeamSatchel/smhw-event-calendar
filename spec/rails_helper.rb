ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'factory_bot_rails'
require 'shoulda/matchers'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false
  config.filter_rails_from_backtrace!

  config.include FactoryBot::Syntax::Methods
  config.include Requests::JsonHelpers, type: :request
  config.include Requests::HeadersHelpers, type: :request
  config.include DataHelpers, type: :request

  config.before(:each, type: :request) do
    include_default_accept_headers
    clean_db
  end
end
