Rails.application.routes.draw do
  resources :transaction_details
  resources :categories
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  authenticated :user do
    root "categories#index", as: :authenticated_root
  end

  unauthenticated do
    # Defines the root path route ("/")
    root "home#index", as: :unauthenticated_root
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"
end
