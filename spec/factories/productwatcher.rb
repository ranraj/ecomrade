FactoryBot.define do
    factory :productwatcher do
      user_id { 1 }
      status { 'New' }
      product_id { 1 }
    end
  end
  