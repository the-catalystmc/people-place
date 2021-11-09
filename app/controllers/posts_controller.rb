class PostsController < ApplicationController
  # load_and_authorize_resource

  def index
    @user = User.find(params[:id])
    @posts = @user.recent_posts
    @limit = params[:limit] unless params[:limit].nil?
  end

  def show
    @current_user = current_user
    @user = current_user
    @user = User.find(params[:id])
    @post = @user.posts.find(params[:post_id])
  end

  def new
    @user = User.find(params[:id])
    @current_user = current_user
    @post = Post.new
    respond_to do |format|
      format.html { render :new }
    end
  end

  def create
    if user_signed_in?
      @user = current_user
      # new object from params
      @post = @user.posts.create(params.require(:post).permit(:title, :text))
      if @post.save
        flash[:notice] = 'Post saved successfully'
        redirect_to user_post_url
      else
        flash.now[:error] = 'Error: Post could not be saved'
        render :new, locals: { post: @post }
      end
    else
      flash.now[:error] = 'Error: Please sign up to make a posts.'
      redirect_to root_path
    end
  end

  def destroy
    @user = current_user
    @post = @user.posts.find(params[:post_id])
    @delete_post = @user.posts.destroy(@post.id)
    if @post.destroy
      flash[:notice] = 'Post deleted successfully'
      redirect_to user_post_url
    else
      flash.now[:error] = 'Error: Post could not be deleted'
      render :new, locals: { post: @post }
    end
  end
end
