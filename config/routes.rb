Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :stores
  resources :categories
  resources :products
  resources :users
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
