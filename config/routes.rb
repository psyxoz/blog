Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"

  resources :posts, only: [:index, :show] do
    get '(page/:page)', action: :index, on: :collection, as: ''
    resources :comments, only: :create
  end

  resources :subscriptions, only: :create do
    get :destroy, on: :collection
  end

  namespace :admin do
    match '/' => 'posts#index', via: :get
    resources :posts
  end
end
