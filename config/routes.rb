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
  resources :items
  resources :category
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


  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end

end
