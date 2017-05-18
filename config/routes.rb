Rails.application.routes.draw do

  root   'static_pages#home'
  get    'users/new'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :posts, only: [:new, :create, :index]
end
