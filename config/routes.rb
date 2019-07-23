Rails.application.routes.draw do

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :images  do
    resources :comments
  end
  get "comments" => "comments#index"
  resources :categories do
    resources :posts
  end
  root 'categories#index'
end
