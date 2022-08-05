# frozen_string_literal: true

json.extract! product, :id, :name, :description, :code, :price, :image_link, :created_at, :updated_at
json.url product_url(product, format: :json)
