Rails.application.routes.draw do
  resources :ideas
  resources :categories
  resources :images, only: [:index, :show, :destroy]
end
