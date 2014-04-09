KardexCrowdintCom::Application.routes.draw do
  devise_scope :user do
    get 'google_apps_sign_in', :to => "crowdint_auth/omniauth_callbacks#google_apps_sign_in"
  end

  devise_for :users, controllers: { omniauth_callbacks: 'crowdint_auth/omniauth_callbacks' }

  namespace :admin do
    resources :achievables
  end
end
