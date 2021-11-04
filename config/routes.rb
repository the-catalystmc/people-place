Rails.application.routes.draw do
  root "users#index"
  get "/users/", to: "users#index", as: 'users'
  get "/users/:id", to: "users#show"
  get "/users/:id/posts", to: "posts#index", as: 'user_post'
  get '/users/:id/posts/new', to: 'posts#new', as: 'new_post' # new
  get "/users/:id/posts/:post_id", to: "posts#show"

  post '/users/:id/posts/new', to: 'posts#create' # create
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
