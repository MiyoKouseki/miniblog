Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/all'
  get 'users/new'
  root 'static_pages#home'
  
  get 'static_pages/home'
  get 'static_pages/help'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :miniposts
  resources :users
end
