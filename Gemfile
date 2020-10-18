source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.1'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap-sass'
gem 'devise'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'pg'
gem 'puma', '~> 3.12'
gem 'rails', '~> 5.2.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'database_cleaner'
  gem 'faker'
  gem 'fasterer'
  gem 'pry-rails'
  gem 'rails-controller-testing'
  gem 'rb-readline'
  gem 'rspec-json_expectations'
  gem 'rspec_junit_formatter'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'simplecov', require: false, group: :test
end

group :development do
  gem 'capybara', '>= 2.15'
  gem 'db-query-matchers'
  gem 'factory_bot_rails'
  gem 'json_spec'
  gem 'launchy'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
  gem 'webdrivers'
end

group :production do
  gem 'rails_12factor'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
