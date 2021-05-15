Rails.application.routes.draw do
  namespace :customer do
    resources :posts,only: [:index, :show, :edit, :update, :new, :create, :destroy ]
    get 'users' => 'users#mypage'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :customers

  get 'top' => 'homes#top'

  get "homes/about", to: "homes#about"
end