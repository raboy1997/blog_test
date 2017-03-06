Rails.application.routes.draw do

  resources :posts do
    resources :comments
  end

  resources :comments do
    resources :comments
  end

  root "posts#index"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  match '/signout',  to: 'sessions#destroy', via: :delete

  post 'users/new' , to: 'users#new'
  #post '/posts/:post_id/comments/:id' , to: 'comments#edit'
  #post '/posts/:post_id/comments/:id/edit' , to: 'comments#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
