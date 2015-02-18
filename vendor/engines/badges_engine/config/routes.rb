BadgesEngine::Engine.routes.draw do
  resources :badges, only: [:index, :show]

  match 'badges/query', to: 'badges#query', via: :get
  match 'users/:user_id/my-badges', to: 'badges#my_badges', via: :get, as: :user_badges
end
