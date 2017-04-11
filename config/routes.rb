Rails.application.routes.draw do
  resources :names, only: [ :new, :create, :index ]
  root 'names#new'
end
