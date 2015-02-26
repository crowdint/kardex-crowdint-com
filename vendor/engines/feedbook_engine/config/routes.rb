FeedbookEngine::Engine.routes.draw do
  resources :quizzes, only: [:update], path: 'quiz' do
    member do
      get :start
      get :finish
    end
  end

  get 'user_quiz/:id', to: 'quizzes#show', as: 'user_quiz'

  namespace :admin do
    resources :feedbook, only: [:index]
    scope :feedbook do
      resources :questions
      resources :quizzes
    end
  end
end
