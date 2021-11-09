class UsersController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
    end
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.three_recent_posts
  end
end
