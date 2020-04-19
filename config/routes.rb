Rails.application.routes.draw do

  
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
  resources :categories
  resources :orders, only: [:index,:create,:new]
  resources :users, only: [:show,:new,:create,:destroy] do
    collection do
      get 'logout'
    end
  end
  
  resources :card, only: [:index, :new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :purchase, only: [:pay, :done ] do
    member do
      get  "pay",  to: "purchase#pay"
      post "done", to: "purchase#done"
    end
  end

end
