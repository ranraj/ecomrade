class ElasticWorker
  include Sidekiq::Worker

  def perform(*args)
    begin
      id = args[0]
      klass = args[1]
      object = klass.constantize.find(id.to_s).reindex
    rescue => e
      Rails.logger "ElasticWorker Sync failure: #{e.message}"
    end
  end
end
