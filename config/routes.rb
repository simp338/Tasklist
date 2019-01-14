Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tasks
  root to: "tasks#index"
  
  get "login", to: "session#new"
  post "login", to: "session#create"
  delete "logout", to: "session#destroy"
  
  get "signup", to: "users#new"
  resources :users, only:[:new, :create, :show, :index]
end
