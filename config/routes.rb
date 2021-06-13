Rails.application.routes.draw do

  #home page
  get '/' => 'sessions#welcome'

  #signup
  get '/signup' => 'patients#new'
  post '/signup' => 'patients#create'

  #login/logout
  get '/login' => 'sessions#new'
  post'/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :categories
  resources :messages
  resources :patients
  resources :appointments

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
