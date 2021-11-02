Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users
  get '/dashboard', to: 'users#dashboard'
  get '/users/:id', to: 'users#show'
  post 'users/edit', to: 'users#update'

  resources :gigs do
    member do
      delete :delete_photo
      post :upload_photo
    end
  end
end
