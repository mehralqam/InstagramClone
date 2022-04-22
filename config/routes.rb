# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :image_elements
  resources :posts
  resources :stories
  # resources :posts do
  #   resources :comments
  # end
  root 'users#index'
end
