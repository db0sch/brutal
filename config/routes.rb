Rails.application.routes.draw do
  namespace :items do
    resources :positions, only: :update
  end
  resources :items, only: [:index, :create]
  devise_for :users
  authenticated :user do
    root 'items#index', as: :authenticated_root
  end
  root 'pages#home'
end
