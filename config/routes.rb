Rails.application.routes.draw do
  resources :users, only: [ :create ]
  resources :generators
  resources :sessions, only: [ :create]
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  root 'generators#index'
end
