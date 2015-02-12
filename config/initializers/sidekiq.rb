require 'sidekiq/web'
Sidekiq.configure_server do |config|
  config.poll_interval = 15
end
