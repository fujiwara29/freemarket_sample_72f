Rails.application.routes.draw do

  get 'card/new'
  get 'card/show'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root "items#index"
  namespace :items do
    resources :searches, only: :index
  end
  resources :items
  # resources :image, only: [:edit, :update]
  resources :categories
  resources :orders, only: [:index,:create,:new]
  resources :users, only: [:show,:new,:create,:destroy] do
    collection do
      get 'logout'
    end
  end
  
  resources :card, only: [:new, :show] do
    collection do
      get 'add_to'
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end