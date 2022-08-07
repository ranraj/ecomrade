class Productwatcher < ApplicationRecord
  belongs_to :user
  belongs_to :product
  paginates_per 10
  max_paginates_per 100
end
