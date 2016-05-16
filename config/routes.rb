Rails.application.routes.draw do

  get 'users/show'
  get '/search', to: 'events#search'
  post '/search', to: 'events#results'

  devise_for :users, :controllers => {:omniauth_callbacks => "callbacks"}
  root to: 'events#index'
  resources :events, :assets
end
