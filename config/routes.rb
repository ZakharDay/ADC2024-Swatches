Rails.application.routes.draw do
  devise_for :users

  resources :projects
  resources :swatches

  resources :fills, only: [:index, :show] do
    collection do
      get "solid"
      get "gradient"
    end
  end

  resources :posts do
    resources :comments
  end

  resources :subscriptions, only: [:create]
  
  namespace :admin do
    resources :projects, only: [:create, :update]
    resources :swatches, except: [:index, :show]
    resources :fills,    except: [:index, :show]
    resources :subscriptions

    resources :colors
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  
  get "welcome/index"
  get "welcome/about"
  
  # Defines the root path route ("/")
  root "welcome#index"
end
