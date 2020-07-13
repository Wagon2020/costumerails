Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :scripts do # , only: [:index, :new, :create, :edit, :update, :destroy]
    resources :scenes, only: [:new, :create, :show]
  end
  resources :scenes, only: [:index, :destroy, :edit, :update]
end
