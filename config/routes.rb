Rails.application.routes.draw do
 
  resources :products do
    resources :comments
  end

  resources :farmers do
    resources :messages
  end

  resources :carts, only: [:create, :index, :destroy]
  get "/users_table", to: "users#index", as:"users_table"
  delete "/users_table/:id", to: "users#destroy"
 
  

  devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions'
      }

  get "/dashboards", to: "dashboards#index", as: 'dashboard'
  get "/dashboards/:id", to: "dashboards#show" 
  
  
  get "/payments/session", to: "payments#get_stripe_id"
  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"

  get "/search", to: "products#search", as: "search"
  get "/seasons", to: "seasons#index", as: "season"

  root to: 'home#index'
end
