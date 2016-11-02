Rails.application.routes.draw do
  resources :users do
    resources :cars, defaults: { format: :json }
  end
  ActiveAdmin.routes(self)
  apipie
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'overrides/registrations',
    sessions:  'overrides/sessions'
  }
end
