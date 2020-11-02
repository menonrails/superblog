class V1::PostsController < ApplicationController
  def index
    # sleep 1
    render json: Post.all
  end
  def show
    # sleep 1
    render json: Post.find(params[:id]),
           include: 'comments',
           fields: { comments: ['name', 'comment_text', 'created_at'] }
  end
  def create
    logger.info "params: #{params.inspect}"
    post = Post.new strong_params
    logger.debug "New post: #{post.attributes.inspect}\n"
    logger.debug "Post should be valid: #{post.valid?}\n"
    if post.save
      render json: post, status: 201
    else
      logger.debug post.errors.full_messages
      render plain: "error"
    end
  end

  private

  def strong_params
    params.require(:post).permit(:title, :description)
  end
end
