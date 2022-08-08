class ElasticSearchWorker
  include Sidekiq::Worker

  def perform(*args)
    puts "Test *** "
  end
end
