Rails.application.routes.draw do
  resources :categories
 get '/' => 'sessions#welcome'
 get '/login' => 'sessions#new'
 post '/login' => 'sessions#create'
 get '/signup' => 'users#new'
 post '/signup' => 'users#create'
 delete '/logout' => 'sessions#destroy'
 get '/auth/:provider/callback' => 'sessions#omniauth'
 get '/patients/patient_meds' => 'patients#patient_meds'
 get '/patients/most_illnesses' => 'patients#most_illnesses'
 root 'sessions#index'

  resources :patients do
    resources :illnesses
    
  end

  resources :users, only: [:new, :show]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
