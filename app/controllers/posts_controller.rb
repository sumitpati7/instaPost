class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).all
  end

  def show
    @post = Post.includes(:comment).find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_index_path, notice: "Post was successfully created."
    else
      redirect_to new_post_path, alert: @post.errors.full_messages
    end
  end

  private
  def post_params
    params.require(:post).permit(:photo, :caption, :user_id)
  end
end
