Rails.application.routes.draw do
  resources :favorites
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root "movies#index"

  resources :movies do
    resources :reviews
  end

  resource :session, only: [:new, :create, :destroy]
  get "login" => "sessions#new"

  resources :users
  get "signup" => "users#new"
end
