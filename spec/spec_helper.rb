require 'simplecov'

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/poltergeist'
require 'sidekiq/testing'

require 'database_cleaner'
require 'shoulda-matchers'
require 'carrierwave'

require 'pry'
require 'codeclimate-test-reporter'

SimpleCov.start do
  add_group 'Controllers', 'app/controllers'
  add_group 'Helpers', 'app/helpers'
  add_group 'Mailers', 'app/mailers'
  add_group 'Models', 'app/models'
  add_filter 'spec/'
  add_filter 'config/'
end

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

engine_path = []
Rails.application.config.engines_list.uniq.each do |engine|
  engine_path = "#{engine}::Engine".constantize
end

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

CodeClimate::TestReporter.start

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

Fabrication.configure do |config|
  fabricator_paths = ['spec/fabricators']
  Rails.application.config.engines_list.uniq.each do |engine|
    engine_path = "#{engine}::Engine".constantize
    fabricator_paths << engine_path.root.join('spec/fabricators').to_s.gsub("#{ Rails.root }/", '')
  end
  config.fabricator_path = fabricator_paths
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"

  config.include Devise::TestHelpers, type: :controller
  config.extend ControllerMacros, type: :controller
  config.include FeatureHelpers, type: :feature
  config.include CarrierWave::Test::Matchers

  config.before(:each) do
    Sidekiq::Worker.clear_all
  end

end

REDIS_URL = ENV['REDIS_URL'] || 'redis://localhost/15'
REDIS = Sidekiq::RedisConnection.create(url: REDIS_URL, namespace: 'testy')

Sidekiq.configure_client do |config|
  config.redis = { url: REDIS_URL, namespace: 'testy' }
end
