Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api do
    jsonapi_resources :events, only: %w[create index]
  end
end
