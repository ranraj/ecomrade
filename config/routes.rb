# frozen_string_literal: true

Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  resources :carts
  resources :productwatchers
  resources :purchaseorders
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  resources :companies
  resources :products
  devise_for :users
  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'products#index'

  namespace :api do
    namespace :v1 do
      resources :companies, only: %i[index show create destroy]
    end
  end

  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
