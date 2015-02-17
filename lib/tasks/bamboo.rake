require 'bamboohr/sync'

namespace :bamboo do
  desc "Synchronize users with bamboo"
  task sync_users: :environment do
    SyncUsersJob.perform_async
  end
end
