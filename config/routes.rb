Rails.application.routes.draw do
  resources :trains
  resources :stations
  resources :routes
  resources :wagons
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

