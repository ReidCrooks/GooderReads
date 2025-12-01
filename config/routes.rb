Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.

  # Devise routes for users
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  root "pages#home"
  get "home", to: "pages#home" # redirects /home to root path
  resources :books

  # Defines the root path route ("/")
  get "books" => "books#home", as: :books_page

  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines user profile route
  get "profile", to: "users#show", as: "profile"

  # Defines user read books route
  get "my_reads", to: "users#my_reads", as: "my_reads"
end
