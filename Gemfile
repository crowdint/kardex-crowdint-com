source 'https://rubygems.org'

ruby '2.1.2'
gem 'rails', '4.0.4'

gem 'bamboohr', github: 'crowdint/bamboohr'
gem 'bootstrap-datepicker-rails'
gem 'bootstrap-sass'
gem 'carrierwave'
gem 'cocoon'
gem 'coffee-rails', '~> 4.0.0'
gem 'crowdint_auth', '0.1.3', github: 'jmoralesc/crowdint_auth_new'
gem 'devise'
gem 'figaro', github: 'laserlemon/figaro'
gem 'fog'
gem 'haml-rails'
gem 'jbuilder', '~> 1.2'
gem 'jquery-rails'
gem 'lol_dba'
gem 'mini_magick'
gem 'pg'
gem 'sass-rails', '~> 4.0.0'
gem 'simple_form'
gem 'slack-notifier', github: 'stevenosloan/slack-notifier'
gem 'uglifier', '>= 1.3.0'
gem 'unicorn'

#Sidekiq
gem 'sinatra', require: false
gem 'sidekiq'
gem 'sidekiq-scheduler', '~> 1'

# Engines
gem 'badges_engine',        path: 'vendor/engines/badges_engine'
gem 'presentations_engine', path: 'vendor/engines/presentations_engine'
gem 'workshops_engine',     path: 'vendor/engines/workshops_engine'

group :doc do
  gem 'sdoc', require: false
end

gem 'rails_12factor', group: :production

group :development, :test do
  gem 'annotate', '>=2.6.0'
  gem 'capybara', '~> 2.2.1'
  gem 'database_cleaner'
  gem 'pry-nav'
  gem 'pry-rails', '~> 0.3.2', require: false
  gem 'rails_best_practices'
  gem 'rspec-rails', '~> 2.14.2'
  gem 'selenium-webdriver'
  gem 'vcr'
end

group :test do
  gem "codeclimate-test-reporter", require: nil
  gem 'fabrication'
  gem 'faker'
  gem 'nyan-cat-formatter'
  gem 'poltergeist', '~> 1.5.0'
  gem 'rspec-sidekiq'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'webmock'
end
