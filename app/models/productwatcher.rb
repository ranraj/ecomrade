# frozen_string_literal: true

class Productwatcher < ApplicationRecord
  enum not_muted: {
    not_muted: 0,
    muted_for_a_day: 1,
    muted_for_a_week: 2,
    muted_for_a_month: 3
  }
  belongs_to :user
  belongs_to :product
  paginates_per 10
  max_paginates_per 100
end
