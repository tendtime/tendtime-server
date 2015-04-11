Rails.application.routes.draw do
  devise_for :users

  resources :products
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'welcome#index'

  match '/project/test', to: 'projects#project_test', as: :project_test, via: [:get, :post]

end
