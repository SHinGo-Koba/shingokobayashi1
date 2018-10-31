Rails.application.routes.draw do

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "about", to: "home#about"
  get "contact", to: "home#contact"
  
  get "signup", to: "users#new"
  post "signup", to: "users#create" 

  resources :users, except: [:index, :new, :create, :destroy]
  resources :posts, except: [:edit, :update] do
    resources :comments, shallow: true, only: [:create, :destroy]
  end

  root "home#index"  

end
