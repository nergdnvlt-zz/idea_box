Rails.application.routes.draw do
  resources :ideas
  resources :categories
  resources :images, except: [:edit, :update]
  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  root 'welcome#index'
end
