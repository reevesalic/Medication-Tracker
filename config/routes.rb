Rails.application.routes.draw do
 get '/' => 'sessions#welcome'
 get '/login' => 'sessions#new'
 post '/login' => 'sessions#create'
 get '/signup' => 'users#new'
 post '/signup' => 'users#create'
 delete '/logout' => 'sessions#destroy'
 get '/auth/:provider/callback' => 'sessions#omniauth'
  
   
  # resources :illnesses, only: [] do
    
  # end

  resources :patients do
    resources :illnesses
    resources :medications
  end

  resources :users, only: [:new, :show]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
