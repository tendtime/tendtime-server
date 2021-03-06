Rails.application.routes.draw do
  devise_for :users

  resources :products
  resources :projects
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'welcome#index'

  namespace :admin do
    root to: 'base#dashboard'
    resources :suppliers, only: [:new, :index, :edit, :create, :update]
  end
end
