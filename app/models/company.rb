class Company < ApplicationRecord
  belongs_to :user
  paginates_per 10
  max_paginates_per 100
end
