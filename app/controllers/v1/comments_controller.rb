class V1::CommentsController < ApplicationController
  # deserializable_resource :post, only: [:create, :update]
  def index
    comments = Post.find(params[:post_id]).comments
    render json: comments,
           include: [:post],
           fields: { post: ['title', 'created_at'] }
  end
  def show
    render json: Comment.where(post_id: params[:post_id], id: params[:id]),
           include: [:post],
           fields: { post: ['title', 'created_at'] }
  end
  def create
    comment = Post.find(params[:post_id]).comments.new strong_params
    if comment.save
      render json: comment,
             include: [:post],
             fields: { post: ['title', 'created_at'] },
             status: 201
    else
      logger.debug comment.errors.full_messages
      render plain: "error"
    end
  end

  private

  def strong_params
    params.require(:comment).permit(:name, :email, :comment_text)
  end
end
