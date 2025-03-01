Rails.application.routes.draw do

  get 'friendships/create'
  root 'posts#index'

  devise_for :users

  # Friendships in users
  resources :users, only: [:index, :show] do
    resources :friendships, only: [:create] do
      collection do
        get 'accept_friend'
        get 'decline_friend'
      end
    end
  end
  # Relations in posts - likes comments
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
