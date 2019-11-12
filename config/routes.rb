Rails.application.routes.draw do
  resources :reviews
  resources :party_times
  resources :rsvps
  resources :users
  resources :businesses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
