Rails.application.routes.draw do
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :events, only: %i(index)

  root to: redirect('/events')
end
