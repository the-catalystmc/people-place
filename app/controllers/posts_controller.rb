class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @posts = @user.recent_posts
    @limit = params[:limit] unless params[:limit].nil?
  end

  def show
    @current_user = current_user
    @user = User.find(params[:id])
    @post = @user.posts.find(params[:post_id])
  end

  def new
    @current_user = current_user
    @post = Post.new
    respond_to do |format|
      format.html { render :new }
    end
  end
end
