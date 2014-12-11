Rails.application.routes.draw do
  scope module: 'workshops_engine' do
    resources :workshops
    namespace :admin do
      resources :workshops
    end
  end
end
