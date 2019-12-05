Rails.application.routes.draw do
  root 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # get '/users/:id/list', to: 'users#list'
  
  resources :users, only: [:index, :new, :create, :show]
  resources :products, only: [:index, :show]
  # resources :users
  # resources :products

  namespace :user do
    resource :profiles
    resources :products
    resources :orders
  end
end