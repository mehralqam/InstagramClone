# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users
  resources :users do
    resources :followrequests
    member do
      get :search_results
    end
  end
  resources :image_elements
  resources :posts do
    resources :likes
    resources :comments
  end
  resources :stories
  resources :followships
  root 'users#index'
end
