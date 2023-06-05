Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  
  get '/logout', to: 'sessions#logout'

  resources :users, only: [:index, :show]
  resources :posts, only: [:new, :create, :index, :show]
  resources :search, only: [:index]
  resources :plates, only: [:index, :show]
  resources :comments, only: [:create]

end
