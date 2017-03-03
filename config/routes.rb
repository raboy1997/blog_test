Rails.application.routes.draw do

  root "static_pages#index"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  match '/signout',  to: 'sessions#destroy', via: :delete

  post 'users/new' , to: 'users#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
