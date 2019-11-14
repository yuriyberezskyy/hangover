Rails.application.routes.draw do
  get "/signup", to: "users#new", as: "signup"
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"

  get "/area", to: "businesses#area", as: "area"
  post "/area", to: "businesses#set_area"
  root 'sessions#new' 
  
  resources :sessions
  resources :reviews
  resources :party_times
  resources :rsvps
  resources :users
  resources :businesses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
