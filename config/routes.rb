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
    resources :user_reactions, only: [:create]
  end

  resources :communities, only: [:index, :new, :create, :edit, :update, :show] do
    # resources :user_communities, only: [:create]
    resources :messages, only: [:create, :destroy]
  end

  resources :reviews, only: [:edit, :update, :destroy]
  resources :user_communities, only: [:index, :create, :destroy]
  resources :user_books, only: [:index, :destroy, :edit, :update]
  post "user_books/:id", to: "user_books#create", as: :add_book
  resources :user_reactions, only: [:index]


  get "discover", to: "books#discover", as: :discover
  get "recommendation", to: "books#recommendation", as: :recommendation
  get "my-profile", to: "pages#my_profile", as: :my_profile
  get "profile/:user_id", to: "pages#user_profile", as: :profile


  resources :surveys, only: [:create] do
    resources :answers, only: [:new, :create]
  end
end
