# frozen_string_literal: true

json.extract! productwatcher, :id, :status, :created_at, :updated_at
json.url productwatcher_url(productwatcher, format: :json)
