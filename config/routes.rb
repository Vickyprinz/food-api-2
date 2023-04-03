Rails.application.routes.draw do
    root 'foods#index'

    # Foods
    resources :foods, only: [:index, :show]
    
    # Cart
    resources :carts, only: [:index, :show, :update] do
      post 'add_item/:food_id', to: 'carts#add_item', as: 'add_item'
      delete 'remove_item/:food_id', to: 'carts#remove_item', as: 'remove_item'
    end
    
    # Orders
    resources :orders, only: [:create, :index, :show] do
      post 'checkout', to: 'orders#checkout', on: :member
    end
    
    # Users
    resources :users, only:[:index, :show, :create, :update, :destroy]

    # Sign-up
    post "/signup", to: "users#create"

    # Remain Logged in
    get "/me", to: "users#show"

    # Change password
    patch "/users/:id/change_password", to: "users#change_password"

    # Login/Logout Sessions
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

    # resources :users, only: [:new, :create]
    # get '/login', to: 'sessions#new', as: 'login'
    # post '/login', to: 'sessions#create'
    # delete '/logout', to: 'sessions#destroy', as: 'logout'
  
end
