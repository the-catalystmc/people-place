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
    @user = User.find(params[:id])
    @current_user = current_user
    @post = Post.new
    respond_to do |format|
      format.html { render :new }
    end
  end

  def create
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
  end
end
