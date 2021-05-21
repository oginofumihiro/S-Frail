Rails.application.routes.draw do
  devise_for :admins, controllers: {sessions: 'admins/sessions'}

  namespace :admins do
    resources :registrations,only: [:edit, :new]
    resources :sessions,only: [:new]
  end

  namespace :admin do
    resources :customers,only: [:index]
    resources :genres,only: [:index, :create, :edit, :update]
  end

  devise_for :customers
  namespace :customer do
    resources :posts,only: [:index, :show, :edit, :update, :new, :create, :destroy ]
    resources :users, only: [:show, :edit, :update, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm

  get 'top' => 'homes#top'

  get "homes/about", to: "homes#about"
end