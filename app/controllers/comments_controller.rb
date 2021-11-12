class CommentsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
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
    if @comment.save
      flash[:notice] = 'comment saved successfully'
      redirect_to post_comments_url
    else
      flash.now[:error] = 'Error: comment could not be saved'
      render :new, locals: { comment: @comment }
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    if @comment.destroy
      flash[:notice] = 'Comment deleted successfully'
      redirect_to user_post_url
    else
      flash.now[:error] = 'Error: Comment could not be deleted'
      render :new, locals: { post: @post }
    end
  end
end
