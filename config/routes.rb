Rails.application.routes.draw do

    devise_for :users
    root 'home#homepage'
    get 'homepage' , to: 'home#homepage'
    get 'dashboard' ,to: 'home#dashboard'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
