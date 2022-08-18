# frozen_string_literal: true

# Sidekiq worker to provision once order commited
class OrderProvisionWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(*args)
    Rails.logger.info "Order provision worker started. #{args[0]}"
  end
end
