class BaseWorkerJob
  include Sidekiq::Job
  sidekiq_options retry: false

  def perform
    puts 'Order provision worker started.'
  end
end
