# frozen_string_literal: true

class OrderProvisionWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  logger = Rails.logger

  def perform(*args)
    logger.info "Order provision worker started. #{args[0]}"
  end
end
