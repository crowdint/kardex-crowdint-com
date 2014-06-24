# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/poltergeist'
require 'simplecov'
require 'database_cleaner'

# Initialize SimpleCov
SimpleCov.start

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

# Mocking auth for Omniauth
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

# Database cleaner
DatabaseCleaner.strategy = :truncation

DatabaseCleaner.clean

# VCR configuration
VCR.configure do |c|
  c.cassette_library_dir = 'spec/support/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
  c.default_cassette_options =  { record: :none }

  #c.filter_sensitive_data('API_TOKEN') { '552dd8d56d0447dc888a10e3df073e5847510377' }
  c.configure_rspec_metadata!

  c.ignore_localhost = true
end

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  # Use devise helpers
  config.include Devise::TestHelpers, type: :controller

  # Including support helpers modules
  config.include FeatureHelpers, type: :feature
end
