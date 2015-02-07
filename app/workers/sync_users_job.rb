require 'bamboohr/sync'
class SyncUsersJob
  include Sidekiq::Worker
  sidekiq_options :queue => :users

  def perform(*args)
    BambooHR::Sync.users
  end
end
