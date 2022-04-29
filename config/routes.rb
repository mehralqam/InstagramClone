# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users
  resources :image_elements
  resources :posts
  resources :stories
  resources :posts do
    resources :comments
  end
  root 'users#index'
end
