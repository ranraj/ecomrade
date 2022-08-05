# frozen_string_literal: true

Rails.application.routes.draw do
  resources :productwatchers
  resources :purchaseorders
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"
  resources :companies
  resources :products
  devise_for :users
  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'home#index'

  namespace :api do
    namespace :v1 do
      resources :companies, only: %i[index show create destroy]
    end
  end
end
