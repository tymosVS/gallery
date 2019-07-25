Rails.application.routes.draw do

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :images  do
    resources :comments
    resources :fans
  end
  get "comments" => "comments#index"

  resources :categories do
    resources :posts
    resources :subscribers
  end
  resource :creators, only: [:create, :new]
  root 'categories#index'
end
