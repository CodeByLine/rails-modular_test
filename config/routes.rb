Rails.application.routes.draw do


  # roots
  root "static_pages#home"

  # sessions
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  get "/signout", to: "sessions#destroy"
  post "/signout", to: "sessions#destroy"


  post '/attractions/:id/go_on_ride' => 'attractions#go_on_ride'
  post '/rides/new' => 'rides#new'

  resources :attractions
  resources :users
  resources :rides




end
