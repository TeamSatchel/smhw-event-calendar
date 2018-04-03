Rails.application.routes.draw do
  resources :events, only: :index
  root to: 'events#index'

  namespace :api do
    resources :events, only: %i[index create]
  end
end
