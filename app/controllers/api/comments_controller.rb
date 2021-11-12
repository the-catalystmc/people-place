class Api::CommentsController < ApiController
  before_action :set_comments

  def show; end

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
end
