Rails.application.routes.draw do
  devise_for :users
  root 'projects#index'

  resources :projects
  resources :tasks do
    match :check, via: :post, on: :member
  end
  resources :plans, only: :index
end
