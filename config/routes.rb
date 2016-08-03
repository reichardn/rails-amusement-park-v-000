Rails.application.routes.draw do


  resources :users

  resources :rides

  resources :attractions
  resources :sessions, only: [:create, :destroy]

   get 'signin' => 'sessions#new'
   post 'logout' => 'sessions#destroy'

  root 'welcome#home'

end