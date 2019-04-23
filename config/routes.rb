Rails.application.routes.draw do
  resources :events, only: %i(index create new)

  root to: 'events#index'
end
