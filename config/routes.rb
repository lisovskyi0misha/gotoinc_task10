Rails.application.routes.draw do
  resources :trains do
    resources :wagons, only: [:new, :create] do
      # post :choose_type, on: :member
      get :choose_type, on: :member
    end
  end
  resources :stations
  resources :routes
  resources :wagons, only: [:index, :edit, :update, :destroy, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

