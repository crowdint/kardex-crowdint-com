KardexCrowdintCom::Application.routes.draw do
  root 'home#index'

  devise_scope :user do
    get 'google_apps_sign_in',
        to: "crowdint_auth/omniauth_callbacks#google_apps_sign_in"
  end

  devise_for :users,
      controllers: { omniauth_callbacks: 'crowdint_auth/omniauth_callbacks' }

  resources :users, except: [:new, :create, :index] do
    member { get 'my-badges', to: 'users#my_badges', as: 'badges' }
  end

  resources :propose_badges, only: :create
  resources :nominee_users, only: :create
  resources :nominee_lists, only: [:index, :show]
  resources :badges, only: [:index, :show]
  resources :votations, only: :index
  resources :votes, only: :create
  resources :presentations, only: [:index]

  match 'badges/query', to: 'badges#query', via: :get

  namespace :admin do
    root "main#index"
    resources :users, only: :index
    resources :nominee_lists, only: [:create, :new]
    resources :votations, except: :edit do
      get 'previous', on: :collection
    end
  end

  scope 'admin' do
    mount BadgesEngine::Engine , at: '/'
    mount PresentationsEngine::Engine, at: '/'
  end

  mount WorkshopsEngine::Engine, at: '/'
end
