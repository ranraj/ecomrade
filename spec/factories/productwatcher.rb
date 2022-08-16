# frozen_string_literal: true

FactoryBot.define do
  factory :productwatcher do
    user_id { 1 }
    status { 'New' }
    product_id { 1 }
  end
end
