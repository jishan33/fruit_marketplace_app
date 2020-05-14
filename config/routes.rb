Rails.application.routes.draw do
  get 'carts/index'
  resources :products
  resources :carts, only: [:create, :index, :destroy]
  

  devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions'
      }
  get "/dashboards", to: "dashboards#index", as: 'dashboard'
  get "/dashboards/:id", to: "dashboards#show" 
  # get "users/sign_up" , to: "users/registrations#new", as: "normal_user"
  
  get "/payments/session", to: "payments#get_stripe_id"
  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"

  root to: 'products#index'
end
