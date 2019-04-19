Rails.application.routes.draw do
  resources :events, only: %i(index create)

  root to: 'events#index'
end
