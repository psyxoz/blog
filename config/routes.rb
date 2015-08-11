Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :posts, only: [:index, :show]
  resources :comments, only: :create
  resources :subscriptions, only: :create do
    get :destroy, on: :collection
  end

  namespace :admin do
    match '/' => 'posts#index', via: :get
    resources :posts
  end
end
