# frozen_string_literal: true

# Product is core model of E Commerce system
# Code is Alpha numeric and unique. Used to identify an product
class Product < ApplicationRecord
  include ProductSearch

  paginates_per 9
  max_paginates_per 100
  
  after_commit :reindex_model
  has_many :productwatcher
  belongs_to :category
  
  def notify
    log "#{productwatcher_ids} notification triggered"
  end
  handle_asynchronously :notify

  def log(text)
    Delayed::Worker.logger.add(Logger::INFO, text)
  end

  def reindex_model
    return unless (previous_changes.keys & search_data.stringify_keys.keys).present?

    ElasticWorker.perform_async(id,
                                self.class.name)
  end

  def category_name 
    Rails.cache.fetch([:category, category_id, :name], expires_in: 5.minutes) do
        category.name
    end
  end
end
