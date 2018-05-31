Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  root 'static_pages#home'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/home', to: 'static_pages#home'
  get '/alternatives', to: 'static_pages#alternatives'
  get '/issues', to: 'static_pages#issues'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :stocks, only: [:index, :show]
  resources :posts
  resources :users
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
