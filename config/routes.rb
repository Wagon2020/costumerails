Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :scripts # , only: [:index, :new, :create, :edit, :update, :destroy]
end
