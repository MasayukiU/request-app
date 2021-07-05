Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: [:edit, :update]

  resources :items do
    resources :approvals, only: [:index, :create]
    resources :disapprovals, only: [:index, :create]
  end
  resources :approvals, only: [:destroy, :show]
  resources :disapprovals, only: [:destroy, :show]

  resources :rooms, only: [:index, :new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
end
