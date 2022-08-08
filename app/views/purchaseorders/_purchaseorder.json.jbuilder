# frozen_string_literal: true

json.extract! purchaseorder, :id, :status, :created_at, :updated_at
json.url purchaseorder_url(purchaseorder, format: :json)
