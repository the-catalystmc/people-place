class Api::PostsController < ApplicationController
  before_action :set_posts

  def show; end

  def index
    # @posts.each do |post|
    #   render json: {
    #     id: post.id,
    #     title: post.title,
    #     text: post.text,
    #     comments_counter: post.comments_counter,
    #     likes_counter: post.likes_counter,
    #     author_id: post.author_id
    #   }
    # end
    render json: @posts
  end

  private

  def set_posts
    @user = User.find(params[:user_id])
    @posts = @user.recent_posts
  end
end
