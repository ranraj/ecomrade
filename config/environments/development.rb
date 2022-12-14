# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

# rubocop:disable  Metrics/BlockLength
Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded any time
  # it changes. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  # Customized for exception handling
  config.consider_all_requests_local = true

  # Enable server timing
  config.server_timing = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations.
  config.i18n.raise_on_missing_translations = true

  # Annotate rendered view with file names.
  # config.action_view.annotate_rendered_view_with_filenames = true

  # Uncomment if you wish to allow Action Cable access from any origin.
  # config.action_cable.disable_request_forgery_protection = true

  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  # TODO: 1: check for env variable

  # log level
  config.log_level = :debug

  # Logs configuration
  config.lograge.formatter = Lograge::Formatters::Json.new

  config.lograge.enabled = true
  config.lograge.base_controller_class = ['ActionController::Base']
  config.lograge.custom_options = lambda do |event|
    {
      request_time: Time.now,
      application: Rails.application.class.module_parent_name,
      process_id: Process.pid,
      host: event.payload[:host],
      remote_ip: event.payload[:remote_ip],
      ip: event.payload[:ip],
      x_forwarded_for: event.payload[:x_forwarded_for],
      # params: event.payload[:params].except(*exceptions).to_json,
      rails_env: Rails.env,
      exception: event.payload[:exception]&.first,
      request_id: event.payload[:headers]['action_dispatch.request_id']
    }.compact
  end

  # Email server configuration
  config.action_mailer.delivery_method = :smtp
  # host = 'example.com' #replace with your own url
  # config.action_mailer.default_url_options = { host: host }

  # config.action_mailer.delivery_method = :test
  host = 'localhost:3000'
  config.action_mailer.default_url_options = { host: host, protocol: 'http' }

  # SMTP settings for gmail
  config.action_mailer.smtp_settings = {
    address: Rails.application.config.mail.server,
    port: 587,
    user_name: Rails.application.config.mail.user_name,
    password: Rails.application.config.mail.password,
    authentication: 'plain',
    enable_starttls_auto: true
  }  

  config.action_controller.perform_caching = true
  config.action_controller.page_cache_directory = Rails.root.join("public", "cached_pages")
end
# rubocop:enable  Metrics/BlockLength
