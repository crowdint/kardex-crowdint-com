ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/poltergeist'
require 'simplecov'
require 'database_cleaner'

SimpleCov.start do
  add_group 'Controllers', 'app/controllers'
  add_group 'Helpers', 'app/helpers'
  add_group 'Mailers', 'app/mailers'
  add_group 'Models', 'app/models'
  add_filter 'spec/'
  add_filter 'config/'
end

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

Capybara.default_host = 'http://localhost:3000'

OmniAuth.configure do |config|
  config.test_mode = true
  config.add_mock(:default, {
    :info => {
                :email => 'foobar@crowdint.com',
                :name => 'foo',
                :password => 'qwerty123',
                :is_admin => true
             }
  })
end

DatabaseCleaner.strategy = :truncation

DatabaseCleaner.clean

VCR.configure do |c|
  c.cassette_library_dir = 'spec/support/vcr_cassettes'

  c.hook_into :webmock

  c.default_cassette_options =  { record: :none }

  c.configure_rspec_metadata!

  c.ignore_localhost = true
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_base_class_for_anonymous_controllers = false

  config.order = "random"

  config.include Devise::TestHelpers, type: :controller

  config.extend ControllerMacros, type: :controller

  config.include FeatureHelpers, type: :feature
end
