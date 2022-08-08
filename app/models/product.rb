# frozen_string_literal: true

class Product < ApplicationRecord
  include ElasticsearchIndexer

  searchkick callbacks: false # ? what is this

  has_many :productwatcher
  paginates_per 10
  max_paginates_per 100

  def notify
    log "#{productwatcher_ids} notification triggered"
  end
  handle_asynchronously :notify

  def log(text)
    Delayed::Worker.logger.add(Logger::INFO, text)
  end

  def search_data
    {
      name:,
      description:,
      productwatcher: productwatcher.count
    }
  end
end
