# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ecom
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    # delayed_job
    config.active_job.queue_adapter = :delayed_job

    # Adding correlation id for log
    config.log_tags = [:request_id]

    # Caching mailer
    config.action_mailer.perform_caching = true
    config.mail = config_for(:mail)

    # Custom exception handling
    config.exceptions_app = self.routes
  end
end
