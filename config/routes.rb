Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#home"
  get 'about', to: 'pages#about'
  get 'home', to: 'pages#home'
  # resources :articles     # gives all the routes needed for our articles, POST, GET, PATCH, DELETE, etc.
  # resources :articles, only: [:show]     # gives only the routes needed for showing our articles: POST.
  resources :articles, only: [:show, :index]
end
