WorkshopsEngine::Engine.routes.draw do
  resources :workshops
  namespace :admin do
    resources :workshops
  end
end
