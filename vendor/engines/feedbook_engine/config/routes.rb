FeedbookEngine::Engine.routes.draw do
  namespace :admin do
    resources :feedbook, only: [:index]
    scope :feedbook do
      resources :questions
      resources :quizes
    end
  end
end
