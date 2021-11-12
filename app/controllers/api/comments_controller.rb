class Api::CommentsController < ApiController
  before_action :set_comments

  def show; end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:id]
    if @comment.save
      flash[:notice] = 'Comment added'
      respond_to do |format|
        format.json { render json: @comment }
      end
    else
      flash[:notice] = 'Comment not added'
      render :new
    end
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
end
