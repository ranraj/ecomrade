# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :productwatcher

  def notify
    log "#{productwatcher_ids} notification triggered"
  end
  handle_asynchronously :notify

  def log(text)
    Delayed::Worker.logger.add(Logger::INFO, text)
  end
end
