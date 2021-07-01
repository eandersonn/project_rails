Rails.application.routes.draw do

  #home page
  get '/' => 'sessions#welcome'

  #login
  get '/login' => 'sessions#new'
  post'/login' => 'sessions#create'

  #signup
  get '/signup' => 'patients#new'
  post '/signup' => 'patients#create'

  #logout
  delete '/logout' => 'sessions#destroy'

  resources :categories
  resources :messages 
  resources :patients, only: [:show]
  resources :appointments do
    resources :messages, only: [:new, :index]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
