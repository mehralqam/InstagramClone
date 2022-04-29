# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :image_elements
  resources :posts
  resources :stories
  root 'users#index'
end
