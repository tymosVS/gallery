require 'resque/server'

Rails.application.routes.draw do
  
  mount Resque::Server.new, at: "/resque"
  namespace :users do
    get 'omniauth_callbacks/facebook'
  end
  devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks", 
                                      sessions: "users/sessions",
                                      registrations: "users/registrations" }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :images, only: [:index, :show] do
    resources :comments, except: [:index, :edit, :update, :destroy, :show]
    resources :fans, except: [:index, :edit, :update, :show]
  end
  get 'comments' => 'comments#index'

  resources :categories, only: [:index, :destroy] do
    resources :posts, path: '', except: [:edit, :update]
    resources :subscribers,  only: [:create, :new, :destroy]
  end

  resource :creators, only: [:create, :new]
  root 'home_pages#index'
  get '/profile', to: 'profile#index'
end
