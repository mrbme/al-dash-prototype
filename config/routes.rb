Rails.application.routes.draw do
  resources :comments
  resources :users, except: [:new]
  resources :widgets
  root to: 'pages#home'
  get '/widgets', to: 'widgets#index'
  get '/signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
