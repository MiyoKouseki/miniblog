Rails.application.routes.draw do
  get 'users/all'
  get 'users/new'
  root 'static_pages#home'
  
  get 'static_pages/home'
  get 'static_pages/help'
  resources :miniposts
  resources :users
end
