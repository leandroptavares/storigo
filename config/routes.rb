Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :books, only: [:index, :show, :create] do
    resources :reviews, only: [:new, :create]
    # resources :user_books, only: [:create]
    resources :reactions, only: [:create]
  end

  resources :communities, only: [:index, :new, :create, :edit, :update, :show] do
    resources :user_communities, only: [:create]
  end

  resources :reviews, only: [:edit, :update, :destroy]
  resources :user_communities, only: [:destroy]
  resources :user_books, only: [:index, :destroy, :edit, :update, :create]

  get "discover", to: "books#discover", as: :discover
  get "recommendation", to: "books#recommendation", as: :recommendation
  get "profile", to: "pages#profile", as: :profile


  resources :surveys, only: [:create] do
    resources :answers, only: [:new, :create]
  end
end
