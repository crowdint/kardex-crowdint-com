[WorkshopsEngine::Engine, KardexCrowdintCom::Application].each do |app|
  app.routes.draw do
    resources :workshops
    namespace :admin do
      resources :workshops
    end
  end
end
