Rails.application.routes.draw do

  get 'users/show'

  devise_for :users, :controllers => {:omniauth_callbacks => "callbacks"}
  root to: 'events#index'
  resources :events, :assets
end
