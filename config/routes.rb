Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :posts, only: [:index, :show]

  namespace :admin do
    match '/' => 'posts#index', via: :get
    resources :posts
  end
end
