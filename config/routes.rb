Rails.application.routes.draw do
  resources :widgets
  root to: 'pages#home'
  get '/widgets' => 'widgets#index'
end
