# frozen_string_literal: true

Rails.application.routes.draw do
  root 'products#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # get '/users/:id/list', to: 'users#list'

  resources :users, only: %i[index new create show]
  resources :products, only: %i[index show]
  # resources :users
  # resources :products

  namespace :user do
    resource :profiles
    get '/profiles/edit_address', to: 'profiles#edit_address'

    resources :products do
      resource :transaction do
        get 'transaction'
      end
      resource :orders do
        post 'confirm'
      end
    end
  end
end
