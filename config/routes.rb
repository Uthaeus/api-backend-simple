Rails.application.routes.draw do
  resources :users do
    collection do
      post '/login', to: 'users#login'
    end
  end

  get 'home', to: 'pages#home'

  resources :comments, only: [:create, :destroy]

  resources :meetups
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
