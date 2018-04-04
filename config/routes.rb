Rails.application.routes.draw do
  resources :ideas
  resources :categories
  resources :images, except: [:edit, :update]

  root 'welcome#index'
end
