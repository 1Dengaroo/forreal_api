# frozen_string_literal: true

source 'https://rubygems.org'
ruby '3.1.2'

gem 'bootsnap', require: false
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.2.0'
gem 'sqlite3', '>= 1.4'
gem 'tzinfo-data', platforms: %i[mswin mswin64 mingw x64_mingw jruby]

group :development, :test do
  gem 'brakeman', require: false
  gem 'debug', platforms: %i[mri mswin mswin64 mingw x64_mingw], require: 'debug/prelude'
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 7.0'
  gem 'rubocop', require: false
  gem 'rubocop-rails-omakase', require: false
  gem 'rubocop-rspec', require: false
end
