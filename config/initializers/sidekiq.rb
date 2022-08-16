# frozen_string_literal: true

require 'sidekiq/api'

redis_config = { url: ENV.fetch('REDIS_SIDEKIQ_URL', nil) }

Sidekiq.configure_client do |config|
  config.redis = redis_config
end

require 'sidekiq/web'
Sidekiq::Web.app_url = '/'
