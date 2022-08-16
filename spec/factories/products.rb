FactoryBot.define do
    factory :product do
      name { Faker::Food.vegetables }
      description { Faker::Food.description }
      code {Faker::Code.asin}
      price { Faker::Config.random }
      image_link { Faker::File.file_name(dir: 'images/')}      
    end
end

