class UsersController < ApplicationController
  def index
    @user = current_user if user_signed_in?
    @users = User.all
  end

  def show
    @user = User.find(params[:user_id])
    @posts = @user.three_recent_posts
  end
end
