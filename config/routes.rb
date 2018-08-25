Rails.application.routes.draw do
  resources :users, except: [:index, :destroy]
  resources :posts, except: [:edit, :update]

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  
  get "about" => "home#about"
  get "contact" => "home#contact"
  
  root "home#index"  

end
