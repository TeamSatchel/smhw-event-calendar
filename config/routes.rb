Rails.application.routes.draw do
  mount_ember_app :frontend, to: '/'

  scope '/api', defaults: { format: 'json' } do
    resources :events, only: %i[index create]
  end
end
