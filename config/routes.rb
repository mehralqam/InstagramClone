# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users
  resources :users, except: %i[edit destroy] do
    resources :followrequests, except: %i[new edit destroy]
    member do
      get :search_results
    end
  end
  resources :image_elements, except: %i[index create new edit show update destroy]
  resources :posts, except: %i[edit] do
    resources :likes, only: :create
    resources :comments, except: %i[index new show]
  end
  resources :stories, except: %i[update edit]
  resources :followships, except: %i[edit show update]
  root 'users#index'
end
