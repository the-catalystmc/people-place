class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @posts = @user.recent_posts
    @limit = params[:limit] unless params[:limit].nil?
  end

  def show
    @user = User.find(params[:id])
    @post = @user.posts.find(params[:author_id])
  end
end
