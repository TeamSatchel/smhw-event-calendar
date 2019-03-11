Rails.application.routes.draw do

  resources :events, only: %i(index new create)

  root 'events#index'
end
