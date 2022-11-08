Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions'}
  root to: 'landing_page#index'
  namespace :admin do
    resources :tickets, only: [:index, :update, :edit, :destroy, :show]
    resources :stations do
      put :inline_update, on: :member
    end
    resources :routes do
      get :edit_stations, on: :member
      put :update_stations, on: :member
    end
    resources :trains do
      put :inline_update, on: :member
      resources :wagons, only: [:new, :create]
    end
    resources :wagons, only: [:index, :edit, :update, :destroy, :show]
  end
  resource :ticket, only: [:show, :new, :create, :destroy] do
    get '/all/:user_id', to: 'tickets#show_all', as: :show_all
    get '/results', to: 'tickets#show_results', as: :show_results
    get '/find', to: 'tickets#search', as: :find
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
