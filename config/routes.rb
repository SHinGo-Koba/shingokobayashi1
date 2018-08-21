Rails.application.routes.draw do
  resources :users, except: [:index, :destroy]
  resources :posts, except: [:edit, :update]
  
  # get 'posts/index' => "posts#index"
  # get "posts/new" => "posts#new"
  # post "posts/create" => "posts#create"
  # get "posts/show/:id" => "posts#show"
  # delete "posts/:id/destroy" => "posts#destroy"
  
  # post "user/create" => "user#create"
  # post "user/:id/edit/user_image" =>"user#edit_user_image"
  # get "user/:id/edit" =>"user#edit"
  # get "user/:user_id" => "user#index"
  # get "signup" => "user#new"
  
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  
  get "about" => "home#about"
  get "contact" => "home#contact"
  
  root "home#index"  

end
