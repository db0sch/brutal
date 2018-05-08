Rails.application.routes.draw do
  resources :items, only: [:index, :create]
  # get 'pages/home'
  devise_for :users
  authenticated :user do
    root 'items#index', as: :authenticated_root
  end
  root 'pages#home'
end
