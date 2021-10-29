Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  get '/dashboard', to: 'users#dashboard'
  post 'users/edit', to: 'users#update'
end
