Rails.application.routes.draw do
  resources :ideas
  resources :categories
  resources :images, except: [:edit, :update]
  resources :users, only: [:new, :create, :show]

  root 'welcome#index'
end
