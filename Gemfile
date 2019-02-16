source 'https://rubygems.org'

ruby File.read(File.join(File.dirname(__FILE__), '.ruby-version'))[/(\d\.){2}\d/]

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'

# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.3.6'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Slim for templates
gem 'slim', '~> 4.0.1'
gem 'slim-rails', '~> 3.2.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2.2'

# ES6 for JS
gem 'webpacker', '~> 3.0.2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Automatic runner
  gem 'guard'
  gem 'guard-bundler', require: false
  gem 'guard-rails'
  gem 'guard-migrate'
  gem 'guard-rubocop'
  gem 'guard-cucumber'
  # Code style checker
  gem 'rubocop', require: false
  # Create models
  gem 'faker'
  gem 'factory_bot_rails'
end

group :development do
  # Very informative error pages with console
  gem 'better_errors'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Testing helpers
  gem 'shoulda-matchers'
  gem 'rails-controller-testing'
  gem 'cucumber-rails', require: false
  gem 'rspec-rails'
  # Acceptance testing
  gem 'capybara'
  # Screenshot all failures
  gem 'capybara-screenshot'
  # Emulate browser
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
  # Clear db between tests
  gem 'database_cleaner'
  # Generate code coverage report
  gem 'simplecov'
  # Automatic runner
  gem 'guard-rspec', require: false
end
