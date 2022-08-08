# frozen_string_literal: true

class Purchaseorder < ApplicationRecord
  paginates_per 10
  max_paginates_per 100
end
