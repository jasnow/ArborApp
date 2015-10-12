source 'https://rubygems.org'

gem 'rails', '4.2.4'

ruby '2.2.3'

gem 'aasm'
gem 'bundler'
gem 'coffee-rails'
gem 'i18n-tasks'
gem 'jbuilder'
gem 'monban'
gem 'omniauth'
gem 'omniauth-slack'
gem 'sass-rails'
gem 'sdoc', group: :doc
gem 'slack-ruby-client'
gem 'turbolinks'
gem 'uglifier'

source 'https://rails-assets.org' do
  gem 'rails-assets-berniestrap'
  gem 'rails-assets-jquery'
  gem 'rails-assets-jquery-ujs'
  gem 'rails-assets-rails-turbolinks'
end

group :development do
  gem 'spring'
  gem 'web-console'
end

group :development, :test do
  gem 'byebug'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'codeclimate-test-reporter', require: false
  gem 'database_cleaner'
  gem 'faker'
  gem 'guard-rspec', require: false
  gem 'guard-rubocop'
  gem 'poltergeist'
  gem 'rack_session_access'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '2.8.0' # LOCKED DOWN
  gem 'simplecov'
  gem 'terminal-notifier-guard'
  gem 'webmock'
end

group :production do
  gem 'pg'
  gem 'puma'
  gem 'rails_12factor'
end
