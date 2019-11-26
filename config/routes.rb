Rails.application.routes.draw do
  root 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # get '/users/:id/list', to: 'users#list'
  
  resources :users, only: [:index, :show]
  resources :products, only: [:index, :show]

  namespace :user do
    resources :products
  end
end