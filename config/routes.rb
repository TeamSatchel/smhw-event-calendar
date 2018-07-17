Rails.application.routes.draw do
  scope :api do
    resources :events, only: [:index, :create]
  end
end
