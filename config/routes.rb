Rails.application.routes.draw do
  root to: 'events#index'

  resources :events, only: %i[index create]
end
