class Api::CommentsController < ApplicationController
  before_action :set_comments

  def create
    user = current_user
    comment = Comment.new(comment_params)
    comment.author = user
    response = if comment.save
                 { comment: comment }
               else
                 { message: "comment didn't save" }
               end
    json_response(response)
  end

  def index
    # @comments.each do |comment|
    #   render json: {
    #     id: comment.id,
    #     text: comment.text,
    #     author_id: comment.author_id,
    #     post_id: comment.post_id
    #   }
    # end
    render json: @comments
  end

  private

  def set_comments
    @post = Post.find(params[:post_id])
    @comments = @post.recent_comments(100)
  end

  def comment_params
    params.permit(
      :text,
      :post_id
    )
  end
end
