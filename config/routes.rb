Rails.application.routes.draw do
  resources :products
  devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions'
      }
  get "/dashboards", to: "dashboards#index", as: 'dashboard'
  get "/dashboards/:id", to: "dashboards#show" 
  get "users/sign_up" , to: "users/registrations#new", as: "normal_user"

  
  
  root to: 'products#index'
end
