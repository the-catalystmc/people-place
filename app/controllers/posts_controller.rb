class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @limit = params[:limit] unless params[:limit].nil?
  end

  def show
    @user = User.find(params[:id])
    @post = @user.posts.find(params[:id])
  end
end
