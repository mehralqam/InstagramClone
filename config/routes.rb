# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users
  resources :users, except: %i[destroy] do
    resources :follow_requests, except: %i[show update edit destroy]
    member do
      get :search_results
    end
  end
  resources :image_elements
  resources :posts, except: %i[edit] do
    resources :likes, except: %i[new update edit ]
    resources :comments, except: %i[index new show]
  end
  resources :stories
  resources :followships, except: %i[edit show update]
  root 'users#index'
end
