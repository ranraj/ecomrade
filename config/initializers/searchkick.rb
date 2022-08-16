# frozen_string_literal: true

ENV['ELASTICSEARCH_URL'] ||= "http://#{ENV.fetch('ELASTICSEARCH_HOST', nil)}:9200" if ENV['ELASTICSEARCH_HOST']
