Rails.application.routes.draw do
  root 'dashboard#index'

  # Has_One Relationship
  # resources :users

  get '/users', to: 'users#index'
  
  post '/users', to: 'users#create'
  get '/users/new', to: 'users#new'
  

  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  get '/users/:id', to: 'users#show', as: 'user'

  put   '/users/:id', to: 'users#update'
  patch '/users/:id', to: 'users#update'
  
  delete '/users/:id', to: 'users#destroy'

  #
  # get '/users', to: 'users#index'
  

end
