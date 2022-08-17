# frozen_string_literal: true

class Purchaseorder < ApplicationRecord
  belongs_to :user

  paginates_per 10
  max_paginates_per 100
end
