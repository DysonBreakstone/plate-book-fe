Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :users, only: [:index]
  resources :search, only: [:index]
  resources :plates, only: [:index]
  resources :posts, only: [:index]
end
