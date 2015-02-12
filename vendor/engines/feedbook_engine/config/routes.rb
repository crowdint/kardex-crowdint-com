FeedbookEngine::Engine.routes.draw do
  resources :quizzes, only: [:show, :update], path: 'quiz' do
    member do
      get :start
      get :next
      get :finish
    end
  end

  namespace :admin do
    resources :feedbook, only: [:index]
    scope :feedbook do
      resources :questions
      resources :quizzes
    end
  end
end
