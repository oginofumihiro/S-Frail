Rails.application.routes.draw do
  get 'inquiry/index'
  get 'inquiry/confirm'
  get 'inquiry/thanks'

  devise_for :admins, controllers: { sessions: 'admins/sessions' }

  namespace :admins do
    resources :registrations, only: %i[edit new]
    resources :sessions, only: [:new]
  end

  namespace :admin do
    get 'out' => 'customers#out'
    resources :customers, only: [:index]
    resources :genres, only: %i[new index create edit update destroy]
  end

  devise_for :customers, controllers: {
    sessions: 'customer/sessions',
    registrations: 'customer/registrations'
  }

  namespace :customer do
    resources :posts, only: %i[index show edit update new create destroy]
    resources :customers, only: %i[show edit update destroy] do
      resources :favorites, only: [:index]
    end
    resources :favorites, only: %i[create destroy]
    resources :post_comments, only: %i[create destroy]
    resources :relationships, only: %i[create destroy]
    get 'favorite' => 'favorites#favorite'
    get 'following' => 'relationships#following'
    get 'follower' => 'relationships#follower'
    get 'out' => 'customers#out'
    get 'ranking' => 'posts#ranking'
    get 'search', to: 'posts#search'
    patch 'withdraw' => 'customers#withdraw'
    get 'unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    patch 'withdraw' => 'customers#withdraw', as: 'withdraw_customer'
    put 'withdraw' => 'customers#withdraw'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm

  root 'homes#top'
  get 'top' => 'homes#top'

  get 'homes/about', to: 'homes#about'
 
  get   'inquiry'         => 'inquiry#index'     # 入力画面
  post  'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post  'inquiry/thanks'  => 'inquiry#thanks'    # 送信完了画面
end
