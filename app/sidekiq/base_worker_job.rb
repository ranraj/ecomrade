class BaseWorkerJob
  include Sidekiq::Job
  sidekiq_options retry: false

  def perform(start_date,end_date)
    puts "Order provision worker started #{start_date} - #{end_date}"
  end
end
