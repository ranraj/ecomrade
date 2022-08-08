# frozen_string_literal: true

module ElasticsearchIndexer
  extend ActiveSupport::Concern

  included do
    after_commit :reindex_model

    def reindex_model
      puts '*** reindex model'
      if (previous_changes.keys & search_data.stringify_keys.keys).present?
        req = {id: self.id,name: self.class.name}
        res = {}
        ElasticSearchWorker.perform_async(req)
      end
    end
  end
end
