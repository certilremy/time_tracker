Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'pages#home'
get "/about", to: "pages#about", as: 'about'
get "/signup", to: "users#new", as: 'signup'
get "/signin", to: "sessions#new", as: 'signin'
get "/logout", to: "sessions#logout", as: 'logout'
post "/signin", to: "sessions#create"
get "/externals", to: "transactions#external", as: 'external'
resources :users, only: %i[create show]
resources :transactions, only: %i[new create show index]
resources :groups, only: %i[new create show index]

end
