# frozen_string_literal: true

# Sidekiq worker class to index the product after commit
class ElasticWorker
  include Sidekiq::Worker

  def perform(*args)
    id = args[0]
    klass = args[1]
    object = klass.constantize.find(id.to_s).reindex
    Rails.logger "ElasticWorker Synced #{object} .."
  rescue StandardError => e
    Rails.logger "ElasticWorker Sync failure: #{e.message}"
  end
end
