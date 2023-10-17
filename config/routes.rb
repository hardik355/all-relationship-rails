Rails.application.routes.draw do
  root 'dashboard#index'
  # Has_One Relationship
  get '/users', to: 'users#index'

  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'

  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  put   '/users/:id', to: 'users#update'
  patch '/users/:id', to: 'users#update'

  delete '/users/:id', to: 'users#destroy'
  get '/users/:id', to: 'users#show', as: 'user'

  # Has Many Relationship
  get '/artists', to: 'artists#index'
  post '/artists', to: 'artists#create'
  get '/artists/new', to: 'artists#new'

  # Songs Routes
  get '/songs', to: 'songs#index'

  get '/songs/new', to: 'songs#new'
  post '/songs', to: 'songs#create'

  get '/songs/:id/edit', to: 'songs#edit', as: 'edit_song'
  put   '/songs/:id', to: 'songs#update'
  patch '/songs/:id', to: 'songs#update'

  delete '/songs/:id', to: 'songs#destroy'
  get '/songs/:id', to: 'songs#show', as: 'song'

  # HABTM RELATIONSHIP ROUTES
  get '/posts', to: 'posts#index'

  get '/posts/new', to: 'posts#new'
  post '/posts', to: 'posts#create'

  get '/posts/:id/edit', to: 'posts#edit', as: 'edit'
  patch '/posts/:id', to: 'posts#update'
  put '/posts/:id', to: 'posts#update'

  put '/posts/:id', to: 'posts#show', as: 'post'
  delete '/posts/:id', to: 'posts#destroy'

  get 'all_post', to: 'posts#all_post'

  post 'create_comment', to: 'posts#create_comment'

  # TAgG Routes
  resources :tags

end
