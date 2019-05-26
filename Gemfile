# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'

# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.3'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # Should be disabled when debug with IntelliJ IDEA
  # gem 'byebug', '9.0.6', platform: :mri

  # Use Puma as the app server
  gem 'puma', '~> 3.11'
end

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# Serialize models to JSON
gem 'active_model_serializers', '~> 0.10'

group :development do
  # Listen to file modifications and notifies you about the changes
  gem 'listen', '~> 3.1'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.0'

  # Make Spring watch the filesystem for changes using Listen rather than by polling the filesystem
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Autodeploy
  gem 'capistrano', '~> 3.11.0'
  gem 'capistrano-bundler', '~> 1.3'
  gem 'capistrano-passenger', '~> 0.2'
  gem 'capistrano-rails', '~> 1.3'
  gem 'capistrano-rvm', '~> 0.1'

  # N+1 queries detector
  gem 'bullet', '~> 6'

  # Ruby code analyzers
  gem 'rails_best_practices', '~> 1.19', require: false
  gem 'rubocop', '~> 0.52', require: false

  # Security analizer
  gem 'brakeman', '~> 4.2', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

## Other useful stuff

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Code quality report
# gem "rubycritic", '2.9.1', require: false
