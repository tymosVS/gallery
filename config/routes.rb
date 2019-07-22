Rails.application.routes.draw do
  devise_for :users
  resources :images  do
    resources :comments
  end
  get "comments" => "comments#index"
  resources :categories do
    resources :posts
  end
  root 'images#index'
end
