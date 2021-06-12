Rails.application.routes.draw do
  devise_for :admins, controllers: {sessions: 'admins/sessions'}

  namespace :admins do
    resources :registrations,only: [:edit, :new]
    resources :sessions,only: [:new]
  end

  namespace :admin do
    resources :customers,only: [:index]
    get "out" => "customers#out"
    resources :genres,only: [:index, :create, :edit, :update, :destroy]
  end

  devise_for :customers
  namespace :customer do
    resources :posts,only: [:index, :show, :edit, :update, :new, :create, :destroy]
    resources :customers, only: [:show, :edit, :update, :destroy]
    resources :favorites, only: [:create, :destroy]
    # resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy]
    resources :relationships, only: [:create, :destroy]
    get "out" => "customers#out"
    get "ranking" => "posts#ranking"
    get 'search', to: 'posts#search'
    patch 'withdraw' => "customers#withdraw"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm

  get "top" => "homes#top"

  get "homes/about", to: "homes#about"
end