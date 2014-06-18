KardexCrowdintCom::Application.routes.draw do
  devise_scope :user do
    get 'google_apps_sign_in',
        to: "crowdint_auth/omniauth_callbacks#google_apps_sign_in"
  end

  devise_for :users,
      controllers: { omniauth_callbacks: 'crowdint_auth/omniauth_callbacks' }

  root to: "users#index"

  mount BadgesEngine::Engine, at: '/admin'

  namespace :admin do
    root to: "main#index"

    resources :workshops, except: :show
  end

  resources :users, except: [:new, :create, :destroy]
end
