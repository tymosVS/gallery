Rails.application.routes.draw do

  namespace :users do
    get 'omniauth_callbacks/facebook'
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, :only => [:index]
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
