KardexCrowdintCom::Application.routes.draw do
  root 'home#index'

  devise_scope :user do
    get 'google_apps_sign_in',
        to: "crowdint_auth/omniauth_callbacks#google_apps_sign_in"
  end

  devise_for :users,
      controllers: { omniauth_callbacks: 'crowdint_auth/omniauth_callbacks' }

  resources :users, except: [:new, :create, :index]

  resources :propose_badges, only: :create
  resources :nominee_users, only: :create
  resources :nominee_lists, only: [:index, :show]
  resources :vote_events, only: :index
  resources :votes, only: :create
  resources :presentations, only: [:index]

  namespace :admin do
    root "main#index"
    resources :users, only: :index
    resources :nominee_lists, only: [:create, :new]
    resources :vote_events, except: :edit do
      get 'previous', on: :collection
    end
  end

  scope 'admin' do
    mount PresentationsEngine::Engine, at: '/'
    mount Sidekiq::Web => '/sidekiq'
  end

  mount BadgesEngine::Engine, at: '/'
  mount WorkshopsEngine::Engine, at: '/'
end
