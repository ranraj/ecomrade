class BaseWorkerJob
  include Sidekiq::Job
  sidekiq_options retry: false
  logger = Rails.logger

  def perform
    logger.info 'Order provision worker started.'
  end
end
