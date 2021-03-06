require 'bamboohr/sync'
class SyncUsersJob
  include Sidekiq::Worker
  sidekiq_options queue: :users, retry: 3, backtrace: true

  def perform
    BambooHR::Sync.users
  end
end
