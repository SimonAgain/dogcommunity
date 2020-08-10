Rails.application.routes.draw do

  # get 'session/new'
  # get 'session/create'
  # get 'session/destroy'
  # get 'dogs/new'
  # get 'dogs/create'
  # get 'dogs/index'
  # get 'dogs/show'
  # get 'dogs/edit'
  # get 'dogs/update'
  # get 'dogs/destroy'
  # get 'users/new'
  # get 'users/create'
  # get 'users/index'
  # get 'users/show'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/destroy'
  # get 'session/new'
  # get 'session/create'
  # get 'session/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#welcome'

  get '/home' => 'pages#home'

  get '/login' => 'session#new' #login form

  # form submits here, do authentication & create session, redirect or show from with errors
  post '/login' => 'session#create'

  delete '/login' => 'session#destroy' #logout, ie. delete session for this user.


  ## CRUD for users ###
  resources :users

  ## CRUD for users ###
  resources :dogs
end
