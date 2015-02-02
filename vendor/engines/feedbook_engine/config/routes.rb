FeedbookEngine::Engine.routes.draw do
  namespace :admin do
    resources :feedbook, only: [:index]
    scope :feedbook do
      resources :questions
      resources :quizzes
    end
  end
end
