require 'resque/server'

Rails.application.routes.draw do
  mount Resque::Server.new, at: "/resque"
  namespace :users do
    get 'omniauth_callbacks/facebook'
  end
  devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks", 
                                      sessions: "users/sessions" }

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
  root 'home_pages#index'
  get '/profile', to: 'profile#index'
end
