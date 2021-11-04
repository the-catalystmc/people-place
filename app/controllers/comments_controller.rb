class CommentsController < ApplicationController
  # def create
  #     @current_user = current_user
  #     @user = User.find(params[:user_id])
  #     @post = Post.find(params[:post_id])
  #     @comment = Comment.new(comments_params)
  #     @comment.post = @post
  #     @comment.author = @current_user

  #     if @comment.save
  #       redirect_to user_post_path(@user, @post)
  #     else
  #       render user_post_path(@user, @post)
  #     end
  #   end

  def new
    @user = User.find(params[:id])
    @post = Post.find(params[:post_id])
    @current_user = current_user
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new }
    end
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    # new object from params
    @comment = @user.comments.new(params.require(:comment).permit(:text))
    @comment.author = @user
    @comment.post = @post
    @comment.save
    # respond_to block
    respond_to do |format|
      format.html do
      end
    end
    # if question saves
    if @comment.save
      flash[:success] = 'comment saved successfully'
      redirect_to post_comments_url
    else
      flash.now[:error] = 'Error: comment could not be saved'
      render :new, locals: { comment: @comment }
    end
  end
end
