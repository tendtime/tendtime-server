Rails.application.routes.draw do
  devise_for :users
  
  root 'welcome#index'

  get '/project/test', to: 'projects#project_test', as: :project_test

end
