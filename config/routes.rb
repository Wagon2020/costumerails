Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :scripts do # , only: [:index, :new, :create, :edit, :update, :destroy]
    resources :scenes, only: [:new, :create, :show]
    resources :roles, only: [:index, :new, :create, :show]
  end
  resources :scenes, only: [:index, :destroy, :edit, :update]
  resources :roles, only: [:destroy, :edit, :update]
end
