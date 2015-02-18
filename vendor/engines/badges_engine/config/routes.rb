BadgesEngine::Engine.routes.draw do
  resources :badges, only: [:index, :show]
end
