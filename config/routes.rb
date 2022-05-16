# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users
  resources :users do
    resources :followrequests
  end
  resources :image_elements
  resources :posts
  resources :stories
  resources :followships
  resources :posts do
    resources :comments
    member do
      patch :post_like
    end
  end
  root 'users#index'
end
