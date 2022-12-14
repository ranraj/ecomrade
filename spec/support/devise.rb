# frozen_string_literal: true

require 'factory_bot'
FactoryBot.define do
  factory :user do
    name { 'test' }
    email { 'test@user.com' }
    password { 'qwerty' }
    # Add additional fields as required via your User model
  end

  # Not used in this tutorial, but left to show an example of different user types
  # factory :admin do
  #   id {2}
  #   email {"test@admin.com"}
  #   password {"qwerty"}
  #   admin {true}
  # end
end
