# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { Faker::Food.vegetables }
    description { Faker::Food.description }
    parent {  }     
  end
end
