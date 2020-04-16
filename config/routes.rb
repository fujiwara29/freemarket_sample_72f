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
  resources :card, only: [:index, :new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :purchase, only: [:index] do
    collection do
      post 'done', to: 'purchase#done'
    end
  end
  get  "items/purchase/pay/:id",  to: "purchase#pay"
  post "items/purchase/pay/done/:id", to: "purchase#done"

end
