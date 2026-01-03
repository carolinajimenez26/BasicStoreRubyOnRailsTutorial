Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  root "products#index"

  # get "/products", to: "products#index" # helper prefix is "products"
  # post "/products", to: "products#create" # helper prefix is "products"
  # get "/products/new", to: "products#new" # helper prefix is "new_product"
  # get "/products/:id/edit", to: "products#edit" # helper prefix is "edit_product"
  # get "/products/:id", to: "products#show" # helper prefix is "product"
  # patch "/products/:id", to: "products#update" # helper prefix is "product"
  # put "/products/:id", to: "products#update" # helper prefix is "product"
  # delete "/products/:id", to: "products#destroy" # helper prefix is "product"
  ## All the above is the same as doing:
  # resources :products

  # Adding subscribers to products
  resources :products do
    resources :subscribers, only: [ :create ]
  end

  # Unsuscribing users
  resource :unsubscribe, only: [ :show ]
end
