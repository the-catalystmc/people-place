Rails.application.routes.draw do
  root "users#index"
  get "/users/", to: "users#index", as: 'users'
  get "/users/:id", to: "users#show"
  get "/users/:id/posts", to: "posts#index", as: 'user_post'
  get '/users/:id/posts/new', to: 'posts#new', as: 'new_post' # new
  get "/users/:id/posts/:post_id", to: "posts#show", as: 'post_comments'
  get "/users/:id/posts/:post_id/comments/new", to: "comments#new", as: "new_comment"


  post '/users/:id/posts/new', to: 'posts#create' # create
  post '/users/:id/posts/:post_id/comments/new', to: 'comments#create' # create
  post "/users/:id/posts/:post_id/like", to: "likes#like", as: "user_create_post_like"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
