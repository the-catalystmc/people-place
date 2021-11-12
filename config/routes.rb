Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    post 'login', to: 'authentication#authenticate'
    post 'signup', to: 'users#create' 
    resources :allposts
    resources :users do
      resources :posts do
        resources :comments
      end
    end
  end
  root "users#index"
  get "/users/", to: "users#index", as: 'users'
  get "/users/:user_id", to: "users#show"
  get "/users/:user_id/posts", to: "posts#index", as: 'user_post'
  get '/users/:user_id/posts/new', to: 'posts#new', as: 'new_post' # new
  get "/users/:user_id/posts/:post_id", to: "posts#show", as: 'post_comments'
  get "/users/:user_id/posts/:post_id/comments/new", to: "comments#new", as: "new_comment"


  post '/users/:user_id/posts/new', to: 'posts#create' # create
  post '/users/:user_id/posts/:post_id/comments/new', to: 'comments#create' # create
  post "/users/:user_id/posts/:post_id/like", to: "likes#like", as: "user_create_post_like"
  delete "/users/:user_id/posts/:post_id", to: "posts#destroy", as: "destroy_post"
  delete "/users/:user_id/posts/:post_id/comments/:id", to: "comments#destroy", as: "destroy_comments"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
