class LikesController < ApplicationController
  def new
    @user = User.find(params[:id])
    @post = Post.find(params[:post_id])
    @current_user = current_user
    @like = Like.new
    respond_to do |format|
      format.html { render :new }
    end
  end

  def create
    @like.author_id = current_user.id
    @like.post_id = post.id
    @like.save
    if @like.save
      redirect_to post_comments_url
    else
      flash.now[:error] = 'To-do item update failed'
      redirect_to post_comments_url
    end
  end
end
