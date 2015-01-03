FeedbookEngine::Engine.routes.draw do
  namespace :admin do
    resources :feedbook, only: [:index]
    namespace :feedbook do
      resources :questions
      resources :quizes
    end
  end
end
