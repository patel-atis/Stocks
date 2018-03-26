Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  root 'static_pages#home'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/home', to: 'static_pages#home'
  get '/alternatives', to: 'static_pages#alternatives'
  get '/issues', to: 'static_pages#issues'

  resources :stocks
  resources :posts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
