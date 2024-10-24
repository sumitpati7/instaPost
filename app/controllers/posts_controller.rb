class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).all.reverse
  end

  def show
    @post = Post.includes(comments: :user).find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      respond_to do |format|
        format.html { redirect_to posts_index_path, notice: "Post was successfully created." }
        format.turbo_stream
      end
    else
      redirect_to new_post_path, alert: @post.errors.full_messages
    end
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path }
      format.turbo_stream
    end
  end

  private
  def post_params
    params.require(:post).permit(:photo, :caption, :user_id)
  end
end
