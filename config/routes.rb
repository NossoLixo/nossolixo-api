Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :v1 do
    resources :categories, only: [:index, :create, :update]
    resources :places, only: [:index, :show, :create, :update]
  end
end
