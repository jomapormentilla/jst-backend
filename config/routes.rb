Rails.application.routes.draw do
  resources :weeks
  resources :activities
  resources :users

  post '/login' => "auth#create"
  get '/profile' => "users#profile"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
