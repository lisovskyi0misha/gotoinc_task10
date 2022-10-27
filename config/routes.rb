Rails.application.routes.draw do
  resources :trains do
    resources :wagons, only: [:new, :create] do
      get :choose_type, on: :member
    end
  end
  resources :stations
  resources :routes do
    get :edit_stations, on: :member
    put :update_stations, on: :member
  end
  resources :wagons, only: [:index, :edit, :update, :destroy, :show]
  resource :search, only: [:show, :new]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
