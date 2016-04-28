Rails.application.routes.draw do
  get 'event_assets/create'

  get 'event_assets/destroy'

  get 'assets/new'

  get 'assets/create'

  get 'assets/show'

  get 'assets/index'

  get 'assets/edit'

  get 'assets/update'

  get 'assets/destroy'

  get 'events/new'

  get 'events/create'

  get 'events/show'

  get 'events/index'

  get 'events/edit'

  get 'events/update'

  get 'events/destroy'

  devise_for :users
  root to: 'events#index'
end
