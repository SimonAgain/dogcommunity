Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#welcome'

  get '/home' => 'pages#home'

  get '/login' => 'session#new' #login form

  # form submits here, do authentication & create session, redirect or show from with errors
  post '/login' => 'session#create'

  delete '/login' => 'session#destroy' #logout, ie. delete session for this user.


  ## CRUD for users ###
  resources :users

  ## CRUD for dogs ###
  resources :dogs

  ## CRUD for photos ##
  resources :photos

  ##custome route to associate a dog to a walker. ##

  get '/walk_dog' => 'dogs#add_dog_to_walker', as: 'walk_dog'
  post '/walk_dog' => 'dogs#process_add_dog_to_walker'

end
