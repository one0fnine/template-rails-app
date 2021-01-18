source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', '~> 1.1'

# Async tasks
gem 'redis', '~> 4.2'
gem 'sidekiq', '~> 6.1'

# ActiveRecord
gem 'strong_migrations', '~> 0.7'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails', '~> 6.1'
  gem 'faker', '~> 2.15', require: false
  gem 'pry', '~> 0.13'
  gem 'pry-byebug', '~> 3.0'
  gem 'pry-rails', '~> 0.3'
  gem 'rspec-rails', '~> 4.0'
  gem 'shoulda-matchers', '~> 4.0', require: false
end

group :development do
  gem 'listen', '~> 3.3'
  # Deploy
  gem "capistrano", "~> 3.14", require: false
  gem 'capistrano3-puma', '~> 5.0', require: false
  gem 'capistrano-bundler', '~> 2.0', require: false
  gem 'capistrano-rails', '~> 1.6', require: false
  gem 'capistrano-rbenv', '~> 2.2', require: false
  gem 'capistrano-sidekiq', github: 'seuros/capistrano-sidekiq', require: false
  gem 'ed25519', '~> 1.2', require: false
  gem 'bcrypt_pbkdf', '~> 1.1', require: false

  # Optimization
  gem 'rack-mini-profiler', '~> 2.0'

  # Audit
  gem 'brakeman', '~> 4.8', require: false
  gem 'bundler-audit', '~> 0.7', require: false

  # Linters
  gem 'fasterer', '~> 0.7', require: false
  gem 'lefthook', '~> 0.7', require: false
  gem 'rubocop', '~> 1.7', require: false
  gem 'rubocop-performance', '~> 1.9', require: false
  gem 'rubocop-rails', '~> 2.9', require: false
  gem 'rubocop-rspec', '~> 2.1', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
